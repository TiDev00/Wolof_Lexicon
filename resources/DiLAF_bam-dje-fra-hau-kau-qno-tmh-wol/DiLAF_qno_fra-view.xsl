<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet version="1.0"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:d="http://www-clips.imag.fr/geta/services/dml"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:jbk="xalan://fr.imag.clips.papillon.business.xsl.JibikiXsltExtension"
	extension-element-prefixes="jbk"
	exclude-result-prefixes="xsl">    
	
	<xsl:output method="xml" encoding="utf-8" indent="no"/>

	<!-- Root template -->
	<xsl:template match="/">
		<xsl:apply-templates select="//entrée">
 			<xsl:with-param name="cid" select="//d:contribution/@d:contribid"/>
 		</xsl:apply-templates>
	</xsl:template>

	<!-- Entry template -->
	<xsl:template match="entrée">
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
	  	<div>
	  		<xsl:attribute name="class">motamot-entry
	  			<!--xsl:call-template name="statusclass">
	  				<xsl:with-param name="author"><xsl:value-of select="jbk:getEntryModificationAuthor(string($eid))"/></xsl:with-param>
	  				<xsl:with-param name="login"><xsl:value-of select="jbk:getUserLogin()"/></xsl:with-param>
	  				<xsl:with-param name="status"><xsl:value-of select="jbk:getEntryStatus(string($eid))"/></xsl:with-param>
	  			</xsl:call-template-->
	  		</xsl:attribute>
				<xsl:apply-templates select="forme" />
				<xsl:apply-templates select="phonétique" />
				<xsl:apply-templates select="cf" />
				<xsl:apply-templates select="catégorie" />
				<xsl:apply-templates select="syntaxe" />
				<xsl:apply-templates select="origine" />
				<xsl:apply-templates select="bloc" />
				<!-- Created by - Modifed by -->
				<!--span class="status">[<xsl:value-of select="@status"/>/<xsl:value-of select="@process_status"/>]</span>
				<span>, </span>
				<span class="status">created by <xsl:value-of select="//d:metadata/d:author/text()" xmlns:d="http://www-clips.imag.fr/geta/services/dml"
					/>, last modified by <xsl:value-of select="//d:modification/d:author/text()" xmlns:d="http://www-clips.imag.fr/geta/services/dml"
				/></span-->
	  	</div>
    </div>
	</xsl:template>
		
	<xsl:template match="forme">
		<span class="headword"><xsl:apply-templates /></span>
	</xsl:template>
	
	<xsl:template match="phonétique">
		<xsl:if test="text()!=''">
			<xsl:text> </xsl:text>/<span class="pronunciation"><xsl:apply-templates /></span>/
		</xsl:if>
	</xsl:template>
		
	<xsl:template match="catégorie">
		<xsl:text> </xsl:text>[<span class="pos"><xsl:apply-templates /></span>]
	</xsl:template>
		
	<xsl:template match="##example_element##">
	  <xsl:if test="text()!=''">
		<xsl:text> </xsl:text><span class="example">
			<xsl:apply-templates />
		</span>
		</xsl:if>
	</xsl:template>

	<xsl:template match="sens">
	  <blockquote>
			<xsl:apply-templates />
		</blockquote>
	</xsl:template>

<!--   vedette -->
<xsl:template match="entrée/forme">
    <font size="+2"><b>
 	  <xsl:value-of select="text()"/>
    </b></font>
</xsl:template>

<!--   phonétique -->
<xsl:template match="phonétique">
 	  &#160;&#160;[<xsl:value-of select="text()"/>]
</xsl:template>


<!--   cf -->
<xsl:template match="cf">
	<p>
		<font color="green">Voir&#160;:&#160;</font>
		<xsl:choose> 
			<xsl:when test="@cible">
				<a><xsl:attribute name="href">AdvancedLookup.po?action=advancedLookup&amp;CRITERIA_NB=1&amp;FACET.0=cdm-entry-id&amp;OPERATOR.0=0&amp;FACETVALUE.0=<xsl:value-of select="@cible"/>&amp;SOURCE.0=All</xsl:attribute>
				<font size="+1"><xsl:value-of select="text()"/></font>
				</a>
			</xsl:when>
			<xsl:otherwise>
				<font size="+1"><xsl:value-of select="text()"/></font>
			</xsl:otherwise>
		</xsl:choose>
	</p>
</xsl:template>


<!--   catégorie -->
<xsl:template match="catégorie">
    <p><font color="green">Catégorie&#160;:&#160;</font>
 	  <xsl:value-of select="text()"/>
	</p>  
</xsl:template>

<!--   syntaxe A REVOIR --> 
<xsl:template match="syntaxe">
    <p><font color="green">Emploi&#160;:&#160;</font>
 	  <font color="SteelBlue"><xsl:value-of select="text()"/></font>
	</p>  
</xsl:template>


<!--   origine -->
<xsl:template match="origine">
    <p><font color="green">Origine&#160;:&#160;</font>
		<font color="SteelBlue"><xsl:value-of select="text()"/></font>
	</p>  
</xsl:template>

<!--   bloc -->
<xsl:template match="bloc">
    <p><table>
		<xsl:apply-templates />
	</table></p>  
</xsl:template>


<!--   sens -->
<xsl:template match="sens">
	<tr>
    <td valign="top">
		<li>
			<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
			<font color="green" size="+1"><b><xsl:value-of select="@num"/></b></font>
				<font color="green">&#160;:&#160;</font>
		</li>
	</td>
    <td>
		<xsl:apply-templates />
	</td>
	</tr>
	<tr>
		<td>
			<p></p>
		</td>
	</tr>
</xsl:template>

<!--   définition -->
<xsl:template match="définition">
		<font color="SteelBlue"><xsl:value-of select="text()"/></font>
</xsl:template>

<!--   exemple -->
<xsl:template match="exemple">
	<p>
	<table>
		<tr>
			<td valign="top"><font color="green">Exemple&#160;:&#160;</font></td>
			<td><xsl:apply-templates /></td>
		</tr>
	</table>  
	</p>  
</xsl:template>

<!--   proverbe -->
<xsl:template match="proverbe">
	<p>
	<table>
		<tr>
			<td valign="top"><font color="green">Proverbe&#160;:&#160;</font></td>
			<td><xsl:apply-templates /></td>
		</tr>
	</table>  
	</p>  
</xsl:template>


<!--   version -->
<xsl:template match="exemple/version">
	<xsl:if test="@lang= 'nou' ">
		<xsl:value-of select="text()"/>
	</xsl:if>
	<xsl:if test="@lang= 'fre' ">
		 <br/><font color="SteelBlue"><xsl:value-of select="text()"/></font>
	</xsl:if>
</xsl:template> 

<!--   reference -->
<xsl:template match="reference">
	<xsl:choose> 
		<xsl:when test="@cible">
			<font color="Grey" size="-1">(Référence : [<a><xsl:attribute name="href">#<xsl:value-of select="@cible"/>
				</xsl:attribute><xsl:value-of select="text()"/></a>])</font>
		</xsl:when>
		<xsl:otherwise>
			<font color="Grey" size="-1">(Référence : [<xsl:value-of select="text()"/>])</font>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template> 

<!--   version -->
<xsl:template match="proverbe/version">
	<xsl:if test="@lang= 'nou' ">
		<xsl:value-of select="text()"/>
	</xsl:if>
	<xsl:if test="@lang= 'fre' ">
		 <br/><font color="SteelBlue"><xsl:value-of select="text()"/></font>
	</xsl:if>
</xsl:template> 


<!--   expression -->
<xsl:template match="expression">
	<p>
		<font color="green">expression&#160;:&#160;</font>
		<xsl:choose> 
			<xsl:when test="@cible">
				<a><xsl:attribute name="href">AdvancedLookup.po?action=advancedLookup&amp;CRITERIA_NB=1&amp;FACET.0=cdm-entry-id&amp;OPERATOR.0=0&amp;FACETVALUE.0=<xsl:value-of select="@cible"/>&amp;SOURCE.0=All</xsl:attribute>
				<font size="+1"><xsl:value-of select="text()"/></font>
				</a>
			</xsl:when>
			<xsl:otherwise>
				<font size="+1"><xsl:value-of select="text()"/></font>
			</xsl:otherwise>
		</xsl:choose>
	</p>
</xsl:template>


<!--   Synonyme -->
<xsl:template match="synonyme">
	<p>
		<font color="green">Synonyme&#160;:&#160;</font>
		<xsl:choose> 
			<xsl:when test="@cible">
				<a><xsl:attribute name="href">AdvancedLookup.po?action=advancedLookup&amp;CRITERIA_NB=1&amp;FACET.0=cdm-entry-id&amp;OPERATOR.0=0&amp;FACETVALUE.0=<xsl:value-of select="@cible"/>&amp;SOURCE.0=All</xsl:attribute>
				<font size="+1"><xsl:value-of select="text()"/></font>
				</a>
			</xsl:when>
			<xsl:otherwise>
				<font size="+1"><xsl:value-of select="text()"/></font>
			</xsl:otherwise>
		</xsl:choose>
	</p>
</xsl:template>

<!--   Antonyme -->
<xsl:template match="antonyme">
	<p>
		<font color="green">Antonyme&#160;:&#160;</font>
		<xsl:choose> 
			<xsl:when test="@cible">
				<a><xsl:attribute name="href">AdvancedLookup.po?action=advancedLookup&amp;CRITERIA_NB=1&amp;FACET.0=cdm-entry-id&amp;OPERATOR.0=0&amp;FACETVALUE.0=<xsl:value-of select="@cible"/>&amp;SOURCE.0=All</xsl:attribute>
				<font size="+1"><xsl:value-of select="text()"/></font>
				</a>
			</xsl:when>
			<xsl:otherwise>
				<font size="+1"><xsl:value-of select="text()"/></font>
			</xsl:otherwise>
		</xsl:choose>
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
