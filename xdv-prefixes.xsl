<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for x:data validation datatype prefixes -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>

  <xsl:output doctype-public='-//W3C//DTD XHTML 1.0 Transitional//EN' doctype-system='http://www.w3.org/TR/xhtml1/DTD/xhtml1-loose.dtd' method='xml'/>

  <xsl:template match='/'>
    <html>
      <head>
        <meta name="url" content="{$OUTPUT_FILENAME}"/>
        <meta name="save_as" content="{$OUTPUT_FILENAME}"/>
        <title><xsl:value-of select='/registry/meta/title'/></title>
        <link rel='stylesheet' type='text/css' href='https://xmpp.org/xmpp.css' />
        <link rel='shortcut icon' type='image/x-icon' href='https://xmpp.org/favicon.ico' />
      </head>
      <body bgcolor='#FFFFFF'>
        <h2><xsl:value-of select='/registry/meta/title'/></h2>
        <xsl:apply-templates select='/registry/meta/overview'/>
        <!--<p><xsl:value-of select='/registry/meta/legal'/></p>-->
        <p>Last Updated: <xsl:value-of select='/registry/meta/revision/date'/></p>
        <p>XML: <a href='https://xmpp.org/registrar/xdv-prefixes.xml'>https://xmpp.org/registrar/xdv-prefixes.xml</a></p>
        <hr />
        <table border='1' cellpadding='3' cellspacing='0'>
          <tr class='body'>
            <th>Prefix</th>
            <th>Description</th>
            <th>Documentation</th>
          </tr>
          <xsl:apply-templates select='/registry/datatype-prefix'/>
        </table>
        <hr />
        <h2>Revision History</h2>
          <blockquote>
            <xsl:apply-templates select='/registry/meta/revision'/>
          </blockquote>
        <hr />
      </body>
    </html>
  </xsl:template>

  <xsl:template match='overview'>
      <p><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match='datatype-prefix'>
    <tr class='body'>
      <td><xsl:value-of select='prefix'/></td>
      <td><xsl:value-of select='desc'/></td>
      <xsl:apply-templates select='doc'/>
    </tr>
  </xsl:template>

  <xsl:template match='doc'>
      <td><xsl:apply-templates/></td>
  </xsl:template>

  <xsl:template match='link'>
    <a href='{@url}'>
    <xsl:apply-templates/>
    </a>
  </xsl:template>

  <xsl:template match='revision'>
    <p><strong><xsl:value-of select='date'/></strong><xsl:text> </xsl:text><xsl:value-of select='remark'/><xsl:text> </xsl:text>(<xsl:value-of select='initials'/>)</p>
  </xsl:template>

</xsl:stylesheet>
