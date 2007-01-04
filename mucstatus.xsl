<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for MUC status codes -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='html'/>

  <xsl:template match='/'>
    <html>
      <head>
        <title><xsl:value-of select='/registry/meta/title'/></title>
        <link rel='stylesheet' type='text/css' href='/xmpp.css' />
        <link rel='shortcut icon' type='image/x-icon' href='/favicon.ico' />
      </head>
      <body bgcolor='#FFFFFF'>
        <h2><xsl:value-of select='/registry/meta/title'/></h2>
        <xsl:apply-templates select='/registry/meta/overview'/>
        <!--<p><xsl:value-of select='/registry/meta/legal'/></p>-->
        <p>Last Updated: <xsl:value-of select='/registry/meta/revision/date'/></p>
        <p>XML: <a href='http://xmpp.org/registrar/mucstatus.xml'>http://xmpp.org/registrar/mucstatus.xml</a></p>
        <p><hr /></p>
        <table border='1' cellpadding='3' cellspacing='0'>
          <tr class='tablebody'>
            <th>Number</th>
            <th>Stanza</th>
            <th>Context</th>
            <th>Purpose</th>
          </tr>
          <xsl:apply-templates select='/registry/statuscode'/>
        </table>
        <p><hr /></p>
        <h2>Revision History</h2>
          <blockquote>
            <xsl:apply-templates select='/registry/meta/revision'/>
          </blockquote>
        <p><hr /></p>
      </body>
    </html>
  </xsl:template>

  <xsl:template match='statuscode'>
    <tr class='tablebody'>
      <td><xsl:value-of select='number'/></td>
      <td><xsl:value-of select='stanza'/></td>
      <td><xsl:value-of select='context'/></td>
      <td><xsl:value-of select='purpose'/></td>
    </tr>
  </xsl:template>

  <xsl:template match='overview'>
      <p><xsl:apply-templates/></p>
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
