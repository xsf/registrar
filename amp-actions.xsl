<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for Advanced Message Processing rule actions registry -->
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
        <p>XML: <a href='http://jabber.org/registrar/amp-actions.xml'>http://jabber.org/registrar/amp-actions.xml</a></p>
        <p><hr /></p>
        <xsl:call-template name='processTOC' />
        <p><hr /></p>
        <xsl:apply-templates select='/registry/action'/>
        <p><hr /></p>
        <h2>Revision History</h2>
          <blockquote>
            <xsl:apply-templates select='/registry/meta/revision'/>
          </blockquote>
        <p><hr /></p>
      </body>
    </html>
  </xsl:template>

  <xsl:template name='processTOC'>
    <h4>Table of Contents</h4>
    <dl>
      <xsl:apply-templates select='//action' mode='toc'/>
    </dl>
  </xsl:template>
      
  <xsl:template match='overview'>
      <p><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match='action' mode='toc'>
    <xsl:variable name='thisname'>
      <xsl:value-of select='name'/>
    </xsl:variable>
    <xsl:variable name='num'>
      <xsl:number level='multiple' count='action'/><xsl:text>. </xsl:text>
    </xsl:variable>
    <dt><xsl:value-of select='$num'/>
      <a href='#{$thisname}'><xsl:value-of select='name' /></a></dt>
  </xsl:template>

  <xsl:template match='action'>
    <a>
      <xsl:attribute name='name'>
        <xsl:value-of select='name'/>
      </xsl:attribute>
    </a>
    <xsl:variable name='num'>
      <xsl:number level='multiple' count='action'/><xsl:text>. </xsl:text>
    </xsl:variable>
    <h3><xsl:value-of select='$num'/><xsl:value-of select='name'/></h3>
    <p>Namespace: <xsl:value-of select='ns'/></p>
    <p>Behavior: <xsl:value-of select='behavior'/></p>
    <p>Defined in <xsl:value-of select='doc'/>.</p>
  </xsl:template>

  <xsl:template match='revision'>
    <p><strong><xsl:value-of select='date'/></strong><xsl:text> </xsl:text><xsl:value-of select='remark'/><xsl:text> </xsl:text>(<xsl:value-of select='initials'/>)</p>
  </xsl:template>

  <xsl:template match='link'>
    <a href='{@url}'>
    <xsl:apply-templates/>
    </a>
  </xsl:template>

</xsl:stylesheet>
