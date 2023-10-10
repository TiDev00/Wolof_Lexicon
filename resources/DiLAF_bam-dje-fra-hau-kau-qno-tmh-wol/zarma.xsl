<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html"/>

<xsl:template match="*" priority="-1"><xsl:element name="{local-name()}">
<xsl:apply-templates select="@*|*|text()"/></xsl:element>
</xsl:template>

<xsl:template match="/">

 <html>
   <head>
     <title>Dictionnaire Zarma</title>
     <link rel="stylesheet" type="text/css" href="zarma.css"/>
   </head>
   <body>
         <h2 style="text-align:center;">Dictionnaire zarma-français</h2>
		<xsl:apply-templates />
    </body>
    </html>
</xsl:template>

<xsl:template match="sanniize">
 <saniize>
 	<xsl:attribute name="id"><xsl:value-of select="text()"/></xsl:attribute>
 	<xsl:apply-templates />
 </saniize>
</xsl:template>

<xsl:template match="di">
 <a>
 	<xsl:attribute name="href">#<xsl:value-of select="text()"/></xsl:attribute>
 	<xsl:apply-templates />
 </a>
</xsl:template>


</xsl:stylesheet>