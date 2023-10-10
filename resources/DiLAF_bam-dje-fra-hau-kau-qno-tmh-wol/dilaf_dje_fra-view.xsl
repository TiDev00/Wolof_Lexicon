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
	<xsl:template match="root-jibiki">
		<xsl:apply-templates select="//article"/>
	</xsl:template>
	
	<!-- orange Niger : E05206 -->

	<!-- Root template -->
	<xsl:template match="/">
		<html>
			<head>
				<meta charset="utf-8" />
				<link rel="stylesheet" type="text/css" href="dilaf.css" />
				<title>Dictionnaire zarma-français</title>
			</head>
			<body>
		<xsl:apply-templates select="//article"/>
		</body>
		</html>
	</xsl:template>

	<!-- Entry template -->
	<xsl:template match="article">
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
	<xsl:template match="article-jibiki">
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
		

	<xsl:template match="sanniize">
		<span class="headword"  style="font-size:200%"><xsl:apply-templates /></span>
	</xsl:template>
	
	<xsl:template match="ciiyaŋ">
		<xsl:if test="text()!=''">
			&#xA0;&#xA0;&#xA0;<span class="pronunciation">[<xsl:apply-templates />]</span>
		</xsl:if>
	</xsl:template>
		
	<xsl:template match="kanandi">
		<p><span class="legende">Catégorie grammaticale&#xA0;:&#xA0;</span><span class="pos"><xsl:apply-templates /></span></p>
	</xsl:template>
		
	<xsl:template match="bareyaŋ">
	  <xsl:if test="text()!=''">
		<p><span class="legende">Équivalent français&#xA0;:&#xA0;</span><span class="fra"><xsl:apply-templates /></span></p>
		</xsl:if>
	</xsl:template>

	<xsl:template match="feeriji">
	  <xsl:if test="text()!=''">
		<p><span class="legende">Définition&#xA0;:&#xA0;</span><span class="definition"><xsl:apply-templates /></span></p>
		</xsl:if>
	</xsl:template>
		
	<xsl:template match="silmaŋ">
	 <p class="examples">
	    <span class="legende">Exemple d&apos;usage&#xA0;:&#xA0;</span><span class="example"><xsl:apply-templates select="version[@lang='dje']"/></span>
	 </p>
	</xsl:template>

	<xsl:template match="f">
			<p><span class="legende">Défini singulier&#xA0;:&#xA0;</span><span class="pos"><xsl:apply-templates /></span></p>
	</xsl:template>

	<xsl:template match="b">
			<p><span class="legende">Défini pluriel&#xA0;:&#xA0;</span><span class="pos"><xsl:apply-templates /></span></p>
	</xsl:template>
	
		<xsl:template match="cidumb">
		<p><span class="legende">Variante dialectale&#xA0;:&#xA0;</span><span class="variante"><xsl:apply-templates /></span></p>
	</xsl:template>


	<xsl:template match="wayc">
	  <xsl:if test="text()!=''">
		<span><xsl:apply-templates /></span>
		</xsl:if>
	</xsl:template>

	<xsl:template match="di">
		<p><span class="legende">Voir : </span>
		 <a><xsl:attribute name="href">javascript:queryOneKey(&apos;cdm-headword&apos;,&apos;<xsl:apply-templates />&apos;,&apos;DiLAF_dje_fra&apos;)</xsl:attribute><xsl:apply-templates/></a>
		</p>	
	</xsl:template>
				
	<xsl:template match="himacare">
		<p><span class="legende">Synonyme : </span>
			<xsl:if test="@nufa"><a><xsl:attribute name="href">javascript:queryOneKey(&apos;cdm-entry-id&apos;,&apos;<xsl:apply-templates select="@nufa"/>&apos;,&apos;DiLAF_dje_fra&apos;)</xsl:attribute><xsl:apply-templates/></a></xsl:if>
			<xsl:if test="not(@nufa)"><xsl:apply-templates/></xsl:if>		
		</p>	
	</xsl:template>
	
		<xsl:template match="wayc">
		<p><span class="legende">Antonyme : </span>
			<xsl:if test="@nufa"><a><xsl:attribute name="href">javascript:queryOneKey(&apos;cdm-entry-id&apos;,&apos;<xsl:apply-templates select="@nufa"/>&apos;,&apos;DiLAF_dje_fra&apos;)</xsl:attribute><xsl:apply-templates/></a></xsl:if>
			<xsl:if test="not(@nufa)"><xsl:apply-templates/></xsl:if>		
		</p>	
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
