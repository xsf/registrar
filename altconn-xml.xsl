<?xml version='1.0' encoding='UTF-8'?>
<!-- stylesheet for alternative connection methods -->
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
<xsl:output method='xml' indent='yes'/>

  <xsl:template match='/'>
    <registry type='alt-connections'>
      <xsl:apply-templates select='/registry/altoconn'/>
    </registry>
  </xsl:template>

  <xsl:template match='ns'>
    <ns>
      <name><xsl:value-of select='name'/></name>
      <name><xsl:value-of select='desc'/></name>
      <name><xsl:value-of select='syntax'/></name>
      <doc><xsl:value-of select='doc'/></doc>
    </ns>
  </xsl:template>

</xsl:stylesheet>
