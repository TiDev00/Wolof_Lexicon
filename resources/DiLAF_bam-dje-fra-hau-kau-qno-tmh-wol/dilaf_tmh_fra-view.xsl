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
		<xsl:apply-templates select="//albab"/>
	</xsl:template>
	
	<!-- Root template -->
	<xsl:template match="root-local">
		<html>
			<head>
				<meta charset="utf-8" />
				<link rel="stylesheet" type="text/css" href="dilaf.css" />
				<title>Dictionnaire tamajaq-français</title>
			</head>
			<body>
		<xsl:apply-templates select="//albab"/>
		</body>
		</html>
	</xsl:template>

	<!-- orange Niger : E05206 -->

	<!-- Entry template -->
	<xsl:template match="albab-local">
	  <div class="contribution" >
	  	<xsl:variable name="eid" select="@id"></xsl:variable>
	  		<div class="collapsable">
			<div style="float:left;">
			<!--span class="entry_navigation">DiLAF</span-->
			<!--a class="entry_navigation">
				<xsl:attribute name="href">Home.po?FACET.0=cdm-headword&amp;OPERATOR.0=0&amp;search_type=previous_entry&amp;action=lookup&amp;TARGETS=*ALL*&amp;SOURCE.0=dje&amp;VOLUME=DiLAF_dje_fra&amp;FACETVALUE.0=<xsl:copy-of select="jbk:getEntryHeadword(string($eid))"/></xsl:attribute>↩</a>
			<a class="entry_navigation"><xsl:attribute name="href">Home.po?FACET.0=cdm-headword&amp;OPERATOR.0=0&amp;search_type=next_entry&amp;action=lookup&amp;TARGETS=*ALL*&amp;SOURCE.0=dje&amp;VOLUME=DiLAF_dje_fra&amp;FACETVALUE.0=<xsl:copy-of select="jbk:getEntryHeadword(string($eid))"/></xsl:attribute>↪</a-->
			</div>
	  			<!--div class="level"><xsl:value-of select="jbk:getEntryGroups(string($eid))"/></div-->
	  			<!--xsl:copy-of select="jbk:editingCommands(string($eid))"/-->
	  		</div>
	  	<xsl:element name="div">
	  		<xsl:attribute name="class">motamot-entry
	  			<!--xsl:call-template name="statusclass">
	  				<xsl:with-param name="author"><xsl:value-of select="jbk:getEntryModificationAuthor(string($eid))"/></xsl:with-param>
	  				<xsl:with-param name="login"><xsl:value-of select="jbk:getUserLogin()"/></xsl:with-param>
	  				<xsl:with-param name="status"><xsl:value-of select="jbk:getEntryStatus(string($eid))"/></xsl:with-param>
	  			</xsl:call-template-->
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
	<xsl:template match="albab">
	  <div class="contribution" >
	  	<xsl:variable name="eid" select="@id"></xsl:variable>
	  		<div class="collapsable">
			<div style="float:left;">
			<!--span class="entry_navigation">DiLAF</span-->
			<!--a class="entry_navigation">
				<xsl:attribute name="href">Home.po?FACET.0=cdm-headword&amp;OPERATOR.0=0&amp;search_type=previous_entry&amp;action=lookup&amp;TARGETS=*ALL*&amp;SOURCE.0=dje&amp;VOLUME=DiLAF_dje_fra&amp;FACETVALUE.0=<xsl:copy-of select="jbk:getEntryHeadword(string($eid))"/></xsl:attribute>↩</a>
			<a class="entry_navigation"><xsl:attribute name="href">Home.po?FACET.0=cdm-headword&amp;OPERATOR.0=0&amp;search_type=next_entry&amp;action=lookup&amp;TARGETS=*ALL*&amp;SOURCE.0=dje&amp;VOLUME=DiLAF_dje_fra&amp;FACETVALUE.0=<xsl:copy-of select="jbk:getEntryHeadword(string($eid))"/></xsl:attribute>↪</a-->
			</div>
	  			<div class="level"><xsl:value-of select="jbk:getEntryGroups(string($eid))"/></div>
	  			<!--xsl:copy-of select="jbk:editingCommands(string($eid))"/-->
	  		</div>
	  	<xsl:element name="div">
	  		<xsl:attribute name="class">motamot-entry
	  			<!--xsl:call-template name="statusclass">
	  				<xsl:with-param name="author"><xsl:value-of select="jbk:getEntryModificationAuthor(string($eid))"/></xsl:with-param>
	  				<xsl:with-param name="login"><xsl:value-of select="jbk:getUserLogin()"/></xsl:with-param>
	  				<xsl:with-param name="status"><xsl:value-of select="jbk:getEntryStatus(string($eid))"/></xsl:with-param>
	  			</xsl:call-template-->
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
		
	<xsl:template match="təzugəst">
		<span class="headword"  style="font-size:200%"><xsl:apply-templates /></span>
	</xsl:template>
	
	<xsl:template match="təmuṣt">
		<p><span class="legende">Catégorie grammaticale&#xA0;:&#xA0;</span><span class="pos"><xsl:apply-templates /></span></p>
	</xsl:template>

	<xsl:template match="əsəfsəs">
		<p><span class="legende">État d'annexion&#xA0;:&#xA0;</span><span class="pos"><xsl:apply-templates /></span></p>
	</xsl:template>
			
	<xsl:template match="igət">
		<p><span class="legende">Pluriel&#xA0;:&#xA0;</span><span class="pos"><xsl:apply-templates /></span></p>
	</xsl:template>

	<xsl:template match="tastəqW">
		<p><span class="legende">Variante tawəlləmət&#xA0;:&#xA0;</span><span class="variante"><xsl:apply-templates /></span></p>
	</xsl:template>

	<xsl:template match="tastəqY">
		<p><span class="legende">Variante tayart&#xA0;:&#xA0;</span><span class="variante"><xsl:apply-templates /></span></p>
	</xsl:template>

	<xsl:template match="əlfiɣšǎt">
		<div class="sense">
			<xsl:apply-templates select="almaɣna"/>
			<xsl:apply-templates select="əlmisal"/>
			<xsl:apply-templates select="təfaransist"/>
			 <xsl:if test="anammelu">
			 	<p><span class="legende">Synonyme<xsl:if test="count(anammelu) &gt; 1">s</xsl:if> : </span>
					<xsl:apply-templates select="anammelu"/>
				</p>
			</xsl:if>
			 <xsl:if test="anəmmezrəy">
			 	<p><span class="legende">Antonyme : </span>
					<xsl:apply-templates select="anəmmezrəy"/>
				</p>
			</xsl:if>
			 <xsl:if test="ǎkku">
			 	<p><span class="legende">Voir : </span>
					<xsl:apply-templates select="ǎkku"/>
				</p>
			</xsl:if>
		</div>
	</xsl:template>
		
	<xsl:template match="təfaransist">
	  <xsl:if test="text()!=''">
		<p><span class="legende">Équivalent français&#xA0;:&#xA0;</span><span class="fra"><xsl:apply-templates /></span></p>
		</xsl:if>
	</xsl:template>

	<xsl:template match="almaɣna">
	  <xsl:if test="text()!=''">
		<p><span class="legende">Définition&#xA0;:&#xA0;</span><span class="definition"><xsl:apply-templates /></span></p>
		</xsl:if>
	</xsl:template>
		
	<xsl:template match="əlmisal">
	 <p class="examples">
	    <span class="legende">Exemple d&apos;usage&#xA0;:&#xA0;</span><span class="example"><xsl:apply-templates /></span>
	 </p>
	</xsl:template>

	<xsl:template match="anammelu">
	<xsl:if test="preceding-sibling::anammelu">,&#xA0;</xsl:if>
	<xsl:if test="@sadderan"><a><xsl:attribute name="href">javascript:queryOneKey(&apos;cdm-entry-id&apos;,&apos;<xsl:apply-templates select="@sadderan"/>&apos;,&apos;DiLAF_tmh_fra&apos;)</xsl:attribute><xsl:apply-templates/></a></xsl:if>
	<xsl:if test="not(@sadderan)"><xsl:apply-templates/></xsl:if>		
	</xsl:template>

	<xsl:template match="anəmmezrəy">
		<xsl:if test="preceding-sibling::anəmmezrəy">,&#xA0;</xsl:if>
		<xsl:if test="@sadderan"><a><xsl:attribute name="href">javascript:queryOneKey(&apos;cdm-entry-id&apos;,&apos;<xsl:apply-templates select="@sadderan"/>&apos;,&apos;DiLAF_tmh_fra&apos;)</xsl:attribute><xsl:apply-templates/></a></xsl:if>
		<xsl:if test="not(@sadderan)"><xsl:apply-templates/></xsl:if>		
	</xsl:template>

	<xsl:template match="ǎkku">
	<xsl:if test="preceding-sibling::ǎkku">,&#xA0;</xsl:if>
		 <a><xsl:attribute name="href">javascript:queryOneKey(&apos;cdm-headword&apos;,&apos;<xsl:apply-templates />&apos;,&apos;DiLAF_tmh_fra&apos;)</xsl:attribute><xsl:apply-templates/></a>
	</xsl:template>

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
