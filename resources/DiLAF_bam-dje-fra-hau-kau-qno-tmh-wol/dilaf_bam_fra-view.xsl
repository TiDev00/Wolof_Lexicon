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
		<xsl:apply-templates select="//item"/>
	</xsl:template>
	
		<!-- Root template -->
	<xsl:template match="root-local">
		<html>
			<head>
				<meta charset="utf-8" />
				<link rel="stylesheet" type="text/css" href="dilaf.css" />
				<title>Dictionnaire bambara-français</title>
			</head>
			<body>
		<xsl:apply-templates select="//item"/>
		</body>
		</html>
	</xsl:template>

	<!-- orange Niger : E05206 -->

	<!-- Entry template -->
	<xsl:template match="item">
	  <div class="contribution" >
	  	<xsl:variable name="eid" select="@id"></xsl:variable>
	  		<div class="collapsable">
			<div style="float:left;">
			<!--span class="entry_navigation">DiLAF</span>
			<a class="entry_navigation">
				<xsl:attribute name="href">Home.po?FACET.0=cdm-headword&amp;OPERATOR.0=0&amp;search_type=previous_entry&amp;action=lookup&amp;TARGETS=*ALL*&amp;SOURCE.0=bam&amp;VOLUME=DiLAF_bam_fra&amp;FACETVALUE.0=<xsl:copy-of select="jbk:getEntryHeadword(string($eid))"/></xsl:attribute>↩</a>
			<a class="entry_navigation"><xsl:attribute name="href">Home.po?FACET.0=cdm-headword&amp;OPERATOR.0=0&amp;search_type=next_entry&amp;action=lookup&amp;TARGETS=*ALL*&amp;SOURCE.0=bam&amp;VOLUME=DiLAF_bam_fra&amp;FACETVALUE.0=<xsl:copy-of select="jbk:getEntryHeadword(string($eid))"/></xsl:attribute>↪</a-->
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
	  		<xsl:apply-templates select="forme" />
	  		<xsl:apply-templates select="forme_tons" />
	  		<xsl:apply-templates select="phon" />
	  		<xsl:if test="forme/@usage">
	  			<p><span class="legende">Utilisé à&#xA0;:&#xA0;</span>
	  				<xsl:apply-templates select="forme/@usage" />
	  			</p>
	  		</xsl:if>
	  		<xsl:if test="forme/@non_usage">
	  			<p><span class="legende">Non utilisé à&#xA0;:&#xA0;</span>
	  				<xsl:apply-templates select="forme/@non_usage" />
	  			</p>
	  		</xsl:if>
	  		<xsl:apply-templates select="variante" />
	  		<xsl:apply-templates select="cf" />
	  		<xsl:if test="(compo_ba/text()!='') or (compo_fr/text()!='')">
	  			<p><span class="legende">Décomposition&#xA0;:&#xA0;</span>
	  				<xsl:apply-templates select="compo_ba" />
	  				<xsl:apply-templates select="compo_fr" />
	  			</p>
	  		</xsl:if>
	  		<xsl:apply-templates select="cat" />
	  		<xsl:apply-templates select="bloc" />
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
	<xsl:template match="item-jibiki">
	  <div class="contribution" >
	  	<xsl:variable name="eid" select="@id"></xsl:variable>
	  		<div class="collapsable">
			<div style="float:left;">
			<!--span class="entry_navigation">DiLAF</span>
			<a class="entry_navigation">
				<xsl:attribute name="href">Home.po?FACET.0=cdm-headword&amp;OPERATOR.0=0&amp;search_type=previous_entry&amp;action=lookup&amp;TARGETS=*ALL*&amp;SOURCE.0=bam&amp;VOLUME=DiLAF_bam_fra&amp;FACETVALUE.0=<xsl:copy-of select="jbk:getEntryHeadword(string($eid))"/></xsl:attribute>↩</a>
			<a class="entry_navigation"><xsl:attribute name="href">Home.po?FACET.0=cdm-headword&amp;OPERATOR.0=0&amp;search_type=next_entry&amp;action=lookup&amp;TARGETS=*ALL*&amp;SOURCE.0=bam&amp;VOLUME=DiLAF_bam_fra&amp;FACETVALUE.0=<xsl:copy-of select="jbk:getEntryHeadword(string($eid))"/></xsl:attribute>↪</a-->
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
	  		<xsl:apply-templates select="forme" />
	  		<xsl:apply-templates select="forme_tons" />
	  		<xsl:apply-templates select="phon" />
	  		<xsl:if test="forme/@usage">
	  			<p><span class="legende">Utilisé à&#xA0;:&#xA0;</span>
	  				<xsl:apply-templates select="forme/@usage" />
	  			</p>
	  		</xsl:if>
	  		<xsl:if test="forme/@non_usage">
	  			<p><span class="legende">Non utilisé à&#xA0;:&#xA0;</span>
	  				<xsl:apply-templates select="forme/@non_usage" />
	  			</p>
	  		</xsl:if>
	  		<xsl:apply-templates select="variante" />
	  		<xsl:apply-templates select="cf" />
	  		<xsl:if test="(compo_ba/text()!='') or (compo_fr/text()!='')">
	  			<p><span class="legende">Décomposition&#xA0;:&#xA0;</span>
	  				<xsl:apply-templates select="compo_ba" />
	  				<xsl:apply-templates select="compo_fr" />
	  			</p>
	  		</xsl:if>
	  		<xsl:apply-templates select="cat" />
	  		<xsl:apply-templates select="bloc" />
				<!--span class="status">[<xsl:value-of select="@status"/>/<xsl:value-of select="@process_status"/>]</span>
				<span>, </span>
				<span class="status">created by <xsl:value-of select="//d:metadata/d:author/text()" xmlns:d="http://www-clips.imag.fr/geta/services/dml"
					/>, last modified by <xsl:value-of select="//d:modification/d:author/text()" xmlns:d="http://www-clips.imag.fr/geta/services/dml"
				/></span-->
	  	</xsl:element>
    </div>
	</xsl:template>

		
	<xsl:template match="forme">
		<span class="headword" style="font-size:200%"><xsl:if test="@geo"><xsl:text>(</xsl:text><xsl:apply-templates select="@geo" /><xsl:text> : </xsl:text></xsl:if><xsl:if test="@autour"><xsl:text>/</xsl:text></xsl:if>
		<xsl:apply-templates /><xsl:if test="@autour"><xsl:text>/</xsl:text></xsl:if><xsl:if test="@geo"><xsl:text>)</xsl:text></xsl:if></span><xsl:text>&#xA0;</xsl:text>
		<xsl:if test="@orthographe"><span class="legende">(Orthographe standardisée de Bamakɔ)</span></xsl:if>
	</xsl:template>
	
		<xsl:template match="variante">
		<p><span class="legende">
			<xsl:if test="@orthographe">Orthographe standardisée de Bamakɔ</xsl:if>
			<xsl:if test="not(@orthographe)">Variante</xsl:if>
			&#xA0;:&#xA0;</span>
			<xsl:if test="@cible"><a><xsl:attribute name="href">javascript:queryOneKey(&apos;cdm-entry-id&apos;,&apos;<xsl:apply-templates select="@cible"/>&apos;,&apos;DiLAF_bam_fra&apos;)</xsl:attribute><xsl:apply-templates select="forme/text()"/></a></xsl:if>
		   <xsl:if test="not(@cible)"><xsl:apply-templates  select="forme/text()"/></xsl:if>		
			<xsl:text>&#xA0;</xsl:text>
			<xsl:apply-templates select="forme_tons"/>
		</p>
	</xsl:template>

	
	<xsl:template match="forme_tons">
		<xsl:if test="text()!=''">
			<xsl:text>&#xA0;</xsl:text><xsl:text>&#xA0;</xsl:text><span class="pronunciation">[<xsl:apply-templates />]</span><xsl:text>&#xA0;</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="phon">
		<xsl:if test="text()!=''">
			<span class="legende"> se prononce </span><span class="pronunciation"><xsl:apply-templates /></span><xsl:text>&#xA0;</xsl:text>
		</xsl:if>
	</xsl:template>
	
		<xsl:template match="compo_ba">
		<xsl:if test="text()!=''">
			<xsl:text>{</xsl:text><span class="bam"><xsl:if test="@autour"><xsl:text>/</xsl:text></xsl:if><xsl:apply-templates /><xsl:if test="@autour"><xsl:text>/</xsl:text></xsl:if></span><xsl:text>}</xsl:text>
		</xsl:if>
	</xsl:template>

		<xsl:template match="compo_fr">
		<xsl:if test="text()!=''">
			<xsl:text>&#xA0;{</xsl:text><span class="fra"><xsl:apply-templates /></span><xsl:text>}</xsl:text>
		</xsl:if>
	</xsl:template>

	
	<xsl:template match="bloc|bloc_expressions">
	<blockquote>
		<xsl:apply-templates />
	</blockquote>
	</xsl:template>

	<xsl:template match="cf">
	<p><span class="legende">Cf : </span>
		<xsl:if test="@cible">
			<a><xsl:attribute name="href">javascript:queryOneKey(&apos;cdm-entry-id&apos;,&apos;<xsl:apply-templates select="@cible"/>&apos;,&apos;DiLAF_bam_fra&apos;)</xsl:attribute><xsl:apply-templates select="forme/text()" /></a>
		</xsl:if>
		<xsl:if test="not(@cible)"><xsl:apply-templates  select="forme/text()"/></xsl:if>		
		&#xA0;
				<xsl:apply-templates  select="forme_tons"/>
			<xsl:if test="@non_usage">
	  			<span class="legende"> non utilisé à&#xA0;:&#xA0;</span>
	  				<xsl:apply-templates select="@non_usage" />
	  		</xsl:if>
	</p>
	</xsl:template>

	<xsl:template match="syn">
	<p><span class="legende">Synonyme : </span>
		<xsl:if test="@cible"><a><xsl:attribute name="href">javascript:queryOneKey(&apos;cdm-entry-id&apos;,&apos;<xsl:apply-templates select="@cible"/>&apos;,&apos;DiLAF_bam_fra&apos;)</xsl:attribute><xsl:apply-templates select="forme/text()"/></a></xsl:if>
		<xsl:if test="not(@cible)"><xsl:apply-templates  select="forme/text()"/></xsl:if>		
		<xsl:apply-templates  select="forme_tons"/>
	</p>
	</xsl:template>

		
	<xsl:template match="cat">
		<p><span class="legende">Catégorie lexicale&#xA0;:&#xA0;</span><span class="pos"><xsl:apply-templates /></span></p>
	</xsl:template>
		
	<xsl:template match="francais">
	  <xsl:if test="text()!=''">
		<p>
			<span class="legende">Équivalent français&#xA0;:&#xA0;</span>
			<span class="fra"><xsl:apply-templates /></span>
		</p>
		</xsl:if>
	</xsl:template>


	<xsl:template match="sens">
	<xsl:if test="count(../sens)>1"><span class="legende">Sens <xsl:number/></span></xsl:if>
	<blockquote>
		<xsl:if test="@terme">
		<p><span class="legende">Terme (<xsl:apply-templates select="@terme"/><xsl:text>)&#xA0;</xsl:text><span class="fra"><xsl:apply-templates select="francais/text()"/></span></span></p>
		</xsl:if>
		<xsl:if test="not(@terme)">
		<xsl:apply-templates select="exemple"/>
		<xsl:apply-templates select="proverbe"/>
		<xsl:apply-templates select="francais"/>
		</xsl:if>
		<xsl:apply-templates select="syn"/>
	</blockquote>
	</xsl:template>

	<xsl:template match="exemple">
		<p><span class="legende">Exemple d&apos;usage&#xA0;:&#xA0;</span>
			<i><xsl:apply-templates select="ba"/></i><br/>
			&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<xsl:apply-templates select="ba_tons"/><br/>
			&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<xsl:apply-templates select="fr"/></p>
	</xsl:template>

	<xsl:template match="proverbe">
		<p><span class="legende">Proverbe :&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</span><xsl:apply-templates select="ba"/><br/>
			&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<xsl:apply-templates select="ba_tons"/><br/>
			&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<xsl:apply-templates select="fr"/><br/>
			&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<span class="legende">Explication :</span>&#xA0;<xsl:apply-templates select="explication"/></p>
	</xsl:template>
	
		<xsl:template match="ba">
			<xsl:apply-templates />
		</xsl:template>
		<xsl:template match="ba_tons">
			<xsl:text>&#xA0;[</xsl:text><xsl:apply-templates /><xsl:text>]</xsl:text>
		</xsl:template>
		
	<xsl:template match="fr">
	  <xsl:if test="text()!=''">
			<span class="fra"><xsl:apply-templates /></span>
	</xsl:if>
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
