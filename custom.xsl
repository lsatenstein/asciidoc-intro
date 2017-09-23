<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exsl="http://exslt.org/common" exclude-result-prefixes="exsl"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version='1.0'>

<!-- Import the default DocBook stylesheet for XSL-FO -->
<xsl:import href="/etc/asciidoc/docbook-xsl/fo.xsl" />

<!-- Overrride the template for 'summary' simpara (paragraphs) -->
<xsl:template match="simpara[@role='summary']">
  <!-- Capture inherited result -->
  <xsl:variable name="baseresult">
    <xsl:apply-imports/>
  </xsl:variable>

  <!-- Customize the result -->
  <xsl:for-each select="exsl:node-set($baseresult)/node()">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:attribute name="font-style">italic</xsl:attribute>
      <xsl:copy-of select="node()"/>
    </xsl:copy>
  </xsl:for-each>
</xsl:template>


</xsl:stylesheet>
