<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet version="1.0" 
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:jbk="xalan://fr.imag.clips.papillon.business.xsl.JibikiXsltExtension"
	extension-element-prefixes="jbk"
	exclude-result-prefixes="xsi xsl">
	<xsl:output method="xml" encoding="utf-8" indent="no"/>

	<!-- Root template -->
	<xsl:template match="/">
		<xsl:apply-templates select="//article"/>
	</xsl:template>

	<!-- Root template -->
	<xsl:template match="root-local">
		<html>
			<head>
				<meta charset="utf-8" />
				<link rel="stylesheet" type="text/css" href="dilaf.css" />
				<title>Dictionnaire kanouri-français</title>
			</head>
			<body>
		<xsl:apply-templates select="//article"/>
		</body>
		</html>
	</xsl:template>
	
		<!-- Entry template -->
	<xsl:template match="article-local">
	  <div class="contribution" >
	  	<xsl:variable name="eid" select="@id"></xsl:variable>
	  	<!--xsl:variable name="source" select="jbk:getEntrySourceLanguage(string($eid))"></xsl:variable-->
	  	<!--xsl:if test="'guest'!=jbk:getUserLogin()"-->
	  		<div class="collapsable">
			<div style="float:left;">
			<!--a class="entry_navigation">
				<xsl:attribute name="href">Home.po?FACET.0=cdm-headword&amp;OPERATOR.0=0&amp;search_type=previous_entry&amp;action=lookup&amp;TARGETS=*ALL*&amp;SOURCE.0=<xsl:value-of select="jbk:getEntrySourceLanguage(string($eid))"/>&amp;VOLUME=<xsl:value-of select="jbk:getEntryVolume(string($eid))"/>&amp;FACETVALUE.0=<xsl:copy-of select="jbk:getEntryHeadword(string($eid))"/></xsl:attribute>↩</a>
			<a class="entry_navigation"><xsl:attribute name="href">Home.po?FACET.0=cdm-headword&amp;OPERATOR.0=0&amp;search_type=next_entry&amp;action=lookup&amp;TARGETS=*ALL*&amp;SOURCE.0=<xsl:value-of select="jbk:getEntrySourceLanguage(string($eid))"/>&amp;VOLUME=<xsl:value-of select="jbk:getEntryVolume(string($eid))"/>&amp;FACETVALUE.0=<xsl:copy-of select="jbk:getEntryHeadword(string($eid))"/></xsl:attribute>↪</a-->
			</div>
	  			<!--div class="level"><xsl:value-of select="jbk:getEntryGroups(string($eid))"/></div-->
	  			<!--xsl:copy-of select="jbk:editingCommands(string($eid))"/-->
	  		</div>
	  	<!--/xsl:if-->
	  	<xsl:element name="div">
	  		<xsl:attribute name="class">motamot-entry
	  			<!--xsl:call-template name="statusclass">
	  				<xsl:with-param name="author"><xsl:value-of select="jbk:getEntryModificationAuthor(string($eid))"/></xsl:with-param>
	  				<xsl:with-param name="login"><xsl:value-of select="jbk:getUserLogin()"/></xsl:with-param>
	  				<xsl:with-param name="status"><xsl:value-of select="jbk:getEntryStatus(string($eid))"/></xsl:with-param>
	  			</xsl:call-template>
	  			<xsl:text> </xsl:text>
	  			<xsl:value-of select="@status"/-->
	  		</xsl:attribute>
	  		<xsl:apply-templates />
				<!-- Created by - Modifed by -->
				<!--span class="status">[<xsl:value-of select="@status"/>/<xsl:value-of select="@process_status"/>]</span>
				<span>, </span>
				<span class="status">created by <xsl:value-of select="//d:metadata/d:author/text()" xmlns:d="http://www-clips.imag.fr/geta/services/dml"
					/>, last modified by <xsl:value-of select="//d:modification/d:author/text()" xmlns:d="http://www-clips.imag.fr/geta/services/dml"
				/></span-->
	  	</xsl:element>
    </div>
	</xsl:template>
		


	<!-- Entry template -->
	<xsl:template match="article">
	  <div class="contribution" >
	  	<xsl:variable name="eid" select="@id"></xsl:variable>
	  	<xsl:variable name="source" select="jbk:getEntrySourceLanguage(string($eid))"></xsl:variable>
	  	<!--xsl:if test="'guest'!=jbk:getUserLogin()"-->
	  		<div class="collapsable">
			<div style="float:left;">
			<!--a class="entry_navigation">
				<xsl:attribute name="href">Home.po?FACET.0=cdm-headword&amp;OPERATOR.0=0&amp;search_type=previous_entry&amp;action=lookup&amp;TARGETS=*ALL*&amp;SOURCE.0=<xsl:value-of select="jbk:getEntrySourceLanguage(string($eid))"/>&amp;VOLUME=<xsl:value-of select="jbk:getEntryVolume(string($eid))"/>&amp;FACETVALUE.0=<xsl:copy-of select="jbk:getEntryHeadword(string($eid))"/></xsl:attribute>↩</a>
			<a class="entry_navigation"><xsl:attribute name="href">Home.po?FACET.0=cdm-headword&amp;OPERATOR.0=0&amp;search_type=next_entry&amp;action=lookup&amp;TARGETS=*ALL*&amp;SOURCE.0=<xsl:value-of select="jbk:getEntrySourceLanguage(string($eid))"/>&amp;VOLUME=<xsl:value-of select="jbk:getEntryVolume(string($eid))"/>&amp;FACETVALUE.0=<xsl:copy-of select="jbk:getEntryHeadword(string($eid))"/></xsl:attribute>↪</a-->
			</div>
	  			<div class="level"><xsl:value-of select="jbk:getEntryGroups(string($eid))"/></div>
	  			<!--xsl:copy-of select="jbk:editingCommands(string($eid))"/-->
	  		</div>
	  	<!--/xsl:if-->
	  	<xsl:element name="div">
	  		<xsl:attribute name="class">motamot-entry<!--xsl:call-template name="statusclass">
	  				<xsl:with-param name="author"><xsl:value-of select="jbk:getEntryModificationAuthor(string($eid))"/></xsl:with-param>
	  				<xsl:with-param name="login"><xsl:value-of select="jbk:getUserLogin()"/></xsl:with-param>
	  				<xsl:with-param name="status"><xsl:value-of select="jbk:getEntryStatus(string($eid))"/></xsl:with-param>
	  			</xsl:call-template>
	  			<xsl:text> </xsl:text>
	  			<xsl:value-of select="@status"/--></xsl:attribute>
	  		<xsl:apply-templates />
				<!-- Created by - Modifed by -->
				<!--span class="status">[<xsl:value-of select="@status"/>/<xsl:value-of select="@process_status"/>]</span>
				<span>, </span>
				<span class="status">created by <xsl:value-of select="//d:metadata/d:author/text()" xmlns:d="http://www-clips.imag.fr/geta/services/dml"
					/>, last modified by <xsl:value-of select="//d:modification/d:author/text()" xmlns:d="http://www-clips.imag.fr/geta/services/dml"
				/></span-->
	  	</xsl:element>
    </div>
	</xsl:template>
		
	<xsl:template match="kalma">
		<span class="headword" style="font-size: larger;"><xsl:apply-templates /></span><xsl:text>&#xA0;</xsl:text>
	</xsl:template>
	
	<xsl:template match="bowodu">
		<xsl:if test="text()!=''">
			<span class="pronunciation">[<xsl:apply-templates />]</span>
		</xsl:if>
		<br />
	</xsl:template>

	<xsl:template match="bowodu_gade">
		<p><span class="legende">Variante : </span>
		    <xsl:if test="@kandan">
         <a>
			<xsl:attribute name="href">javascript:queryOneKey(&apos;cdm-entry-id&apos;,&apos;<xsl:apply-templates select="@kandan"/>&apos;,&apos;DiLAF_kau_fra&apos;)</xsl:attribute>
			<xsl:apply-templates select="kalma/text()"/></a>
    </xsl:if>
    <xsl:if test="not(@kandan)">
       <xsl:apply-templates select="kalma/text()"/>
    </xsl:if>
	<xsl:apply-templates select="bowodu" />
		</p>
	</xsl:template>


	<xsl:template match="naptu_curo_nahauyen">
		<p><span class="legende">Catégorie lexicale : </span><span class="pos"><xsl:apply-templates /></span></p>
	</xsl:template>
	
	<xsl:template match="bǝri">
		<div class="sense"><xsl:apply-templates /></div>
	</xsl:template>

	<xsl:template match="maana">
		<p><span class="legende">Définition : </span><span class="definition"><xsl:apply-templates /></span></p>
	</xsl:template>

	<xsl:template match="maana_tiloa">
		<p><span class="legende">Synonyme : </span>
    <xsl:if test="@kandan">
         <a>
			<xsl:attribute name="href">javascript:queryOneKey(&apos;cdm-entry-id&apos;,&apos;<xsl:apply-templates select="@kandan"/>&apos;,&apos;DiLAF_kau_fra&apos;)</xsl:attribute>
			<xsl:apply-templates select="kalma/text()"/></a>
    </xsl:if>
    <xsl:if test="not(@kandan)">
       <xsl:apply-templates select="kalma/text()"/>
    </xsl:if>
    <xsl:apply-templates select="bowodu"/>
    </p>
	</xsl:template>

	<xsl:template match="fǝrǝm">
		<p><span class="legende">Antonyme : </span>
    <xsl:if test="@kandan">
         <a>
			<xsl:attribute name="href">javascript:queryOneKey(&apos;cdm-entry-id&apos;,&apos;<xsl:apply-templates select="@kandan"/>&apos;,&apos;DiLAF_kau_fra&apos;)</xsl:attribute>
			<xsl:apply-templates select="kalma/text()"/></a>
    </xsl:if>
    <xsl:if test="not(@kandan)">
       <xsl:apply-templates select="kalma/text()"/>
    </xsl:if>
    <xsl:apply-templates select="bowodu"/>
		</p>
	</xsl:template>
		
	<xsl:template match="misal">
	<p><span class="legende">Exemple d'usage : </span>
	    <span class="example"><xsl:apply-templates select="version[@tǝlam='ka']"/></span>
		</p>
	</xsl:template>

	<xsl:template match="kalakta">
	  <xsl:if test="text()!=''">
	<p><span class="legende">Équivalent français : </span>
		<span class="fra"><xsl:apply-templates /></span></p>
		</xsl:if>
	</xsl:template>

	<xsl:template match="mane">
	<p><span class="legende">Voir : </span>
   <xsl:if test="@kandan">
         <a>
			<xsl:attribute name="href">javascript:queryOneKey(&apos;cdm-entry-id&apos;,&apos;<xsl:apply-templates select="@kandan"/>&apos;,&apos;DiLAF_kau_fra&apos;)</xsl:attribute>
			<xsl:apply-templates select="kalma/text()"/></a>
    </xsl:if>
   <xsl:if test="@kandan2">
         <xsl:text>,&#xA0;</xsl:text><a>
			<xsl:attribute name="href">javascript:queryOneKey(&apos;cdm-entry-id&apos;,&apos;<xsl:apply-templates select="@kandan2"/>&apos;,&apos;DiLAF_kau_fra&apos;)</xsl:attribute>
			<xsl:apply-templates select="kalma/text()"/></a>
    </xsl:if>
    <xsl:if test="not(@kandan)">
       <xsl:apply-templates select="kalma/text()"/>
    </xsl:if>
    <xsl:apply-templates select="bowodu"/>
		</p>
	</xsl:template>

	<xsl:template match="ngǝwula">
		<p><span class="legende">Pluriel : </span><span class="ngǝwula"><xsl:apply-templates /></span></p>
	</xsl:template>

	<xsl:template match="complement"></xsl:template>

	
	<xsl:template name="statusclass">
		<xsl:param name="author">unknown</xsl:param>
		<xsl:param name="login">guest</xsl:param>
		<xsl:param name="status">unknown</xsl:param>
		<xsl:choose>
			<xsl:when test="$author=$login">
				<xsl:choose>
					<xsl:when test="$status='finished'">myFinishedEntry</xsl:when>
					<xsl:when test="$status='modified'">modifiedEntry</xsl:when>
					<xsl:when test="$status='deleted'">modifiedEntry</xsl:when>
					<xsl:when test="$status='not finished'">myNotFinishedEntry</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="$status='finished'">finishedEntry</xsl:when>
					<xsl:when test="$status='modified'">modifiedEntry</xsl:when>
					<xsl:when test="$status='deleted'">modifiedEntry</xsl:when>
					<xsl:when test="$status='not finished'">notFinishedEntry</xsl:when>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
