<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for application-specific error conditions -->
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
        <p>XML: <a href='http://xmpp.org/registrar/errors.xml'>http://xmpp.org/registrar/errors.xml</a></p>
        <p><hr /></p>
        <table border='1' cellpadding='3' cellspacing='0'>
          <tr class='tablebody'>
            <th>Namespace</th>
            <th>Element</th>
            <th>Description</th>
            <th>Documentation</th>
          </tr>
          <xsl:apply-templates select='/registry/condition'/>
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

  <xsl:template match='condition'>
    <tr class='tablebody'>
      <td><xsl:value-of select='ns'/></td>
      <td>&lt;<xsl:value-of select='element'/>/&gt;</td>
      <td><xsl:value-of select='desc'/></td>
      <xsl:apply-templates select='doc'/>
    </tr>
  </xsl:template>

  <xsl:template match='overview'>
      <p><xsl:apply-templates/></p>
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
