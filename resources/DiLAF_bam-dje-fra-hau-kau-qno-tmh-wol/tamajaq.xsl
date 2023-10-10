<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html"/>

<xsl:template match="*" priority="-1"><xsl:element name="{local-name()}">
<xsl:apply-templates select="*|text()"/></xsl:element>
</xsl:template>

<xsl:template match="/">

 <html>
   <head>
     <title>Dictionnaire tamajaq-français</title>
     <link rel="stylesheet" type="text/css" href="tamajaq.css"/>
   </head>
   <body>
         <h2 style="text-align:center;">Dictionnaire tamajaq-français</h2>
		<xsl:apply-templates />
    </body>
    </html>
</xsl:template>

<xsl:template match="təfirṭ">
 <təfirṭ>
 	<xsl:attribute name="id"><xsl:value-of select="text()"/></xsl:attribute>
 	<xsl:apply-templates />
	<!--xsl:if test="@nǝmero!=''"-->
	<sup>
	<xsl:apply-templates select="@*"/>
	</sup>
	<!--/xsl:if-->
 </təfirṭ>
</xsl:template>

<xsl:template match="ǎkku">
 <a>
 	<xsl:attribute name="href">#<xsl:value-of select="text()"/></xsl:attribute>
 	<xsl:apply-templates />
 </a>
</xsl:template>


</xsl:stylesheet>