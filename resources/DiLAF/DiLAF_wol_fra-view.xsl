<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet version="1.0"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:d="http://www-clips.imag.fr/geta/services/dml"
	xmlns:jbk="xalan://fr.imag.clips.papillon.business.xsl.JibikiXsltExtension"
	extension-element-prefixes="jbk"
	exclude-result-prefixes="xsl">    
	
	<xsl:output method="xml" encoding="utf-8" indent="no"/>

	<!-- Root template -->
	<xsl:template match="/">
		<xsl:apply-templates select="//dog"/>
	</xsl:template>
<xsl:template match="source">
</xsl:template>

<!--  article -> dog(gb?, mbirmi, maas?, tëggin, xeet, cosaan*, weneen_waxin*, sayu_tekki*) -->
<xsl:template match="dog">
		<table border="3" width="95%" CELLSPACING="20" bgcolor="lightyellow" style="margin:auto;">
			<font face="arial">
				<!-- inversion des balises pour permettre à "tëggin" de venir toujour après "mbirmi" pour lier vedette et sa phonétique -->
				<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
				<xsl:apply-templates select="mbirmi" />
				<xsl:apply-templates select="tëggin" />
				<xsl:apply-templates select="maas" />
				<xsl:apply-templates select="xeet" />
				<xsl:apply-templates select="cosaan" />
				<xsl:apply-templates select="weneen_waxin" />
				<xsl:apply-templates select="sayu_tekki" />
			</font>
		</table>
</xsl:template>


<!--   vedette -> mbirmi -->
<xsl:template match="dog/mbirmi">
    <span    class="headword"    style="font-size:200%">
      <xsl:apply-templates/>
    </span>
</xsl:template>

<!--   classe -> maas -->
<xsl:template match="dog/maas">
    <p>	
		<font face="arial" color="tan"> Classe : </font>
		<xsl:value-of select="text()"/>	
	</p>
</xsl:template>
<!--   phonetique -> tëggin -->
<xsl:template match="dog/tëggin"><xsl:text>&#xA0;&#xA0;</xsl:text>
    <font face="arial" color="brown">
 	  <xsl:value-of select="text()"/>
    </font>
</xsl:template>
<!--   categorie grammaticale -> xeet -->
<xsl:template match="dog/xeet">
    <p>	
		<span    class="legende">Catégorie grammaticale : </span>
		<span    class="pos">
			<xsl:apply-templates/>
		</span>
	</p>
</xsl:template>
<!--   origine -> cosaan -->
<xsl:template match="dog/cosaan">
    <p>	
		<span    class="legende">Origine : </span>
		<span    class="pos">
			<xsl:apply-templates/>
		</span>
	</p>
</xsl:template>


<!--   variante -> weneen_waxin -->
<xsl:template match="dog/weneen_waxin">
    <p>	
		<span    class="legende">Variante : </span>
		<xsl:if    test="@jokkukaay">
			<a>
				<xsl:attribute    name="href">javascript:queryOneKey('cdm-entry-id','
					<xsl:apply-templates    select="@jokkukaay"/>','DiLAF_wol_fra')
				</xsl:attribute>
				<xsl:apply-templates/>
			</a>
		</xsl:if>
		<xsl:if    test="not(@jokkukaay)">
			<xsl:apply-templates/>
		</xsl:if>
	</p>
</xsl:template>


<!--   bloc semantique (ou Sens) -> sayu_tekki(cosaan?, tool*, tekki?, misaal*, guddalinu_méngale*, léebu*, moomeelu_làkk*, bokk_tekki*, safaan*, xoolal*) -->
<xsl:template match="sayu_tekki">
    <xsl:if    test="count(../sayu_tekki)>1">
		<span    class="legende">Sens
			<xsl:number/>
		</span>
    </xsl:if>
    <xsl:if    test="count(../sayu_tekki)=1">
		<span    class="legende">Sens</span>
    </xsl:if>
    <blockquote    class="sense">
		<xsl:apply-templates/>
    </blockquote>
</xsl:template>

<!--   domaine -> tool -->
<xsl:template match="sayu_tekki/tool">
    <p>	
		<span    class="legende">Domaine : </span>
		<span    class="pos">
			<xsl:apply-templates/>
		</span>
	</p>
</xsl:template>


<!--   equivalent -> tekki -->
<xsl:template match="sayu_tekki/tekki">	
   <xsl:if    test="text()!=''">
		<p>
			<span    class="legende">Équivalent français : </span>
				<xsl:apply-templates/>
		</p>
    </xsl:if>	
</xsl:template>

<!--   version -> nettalin -->
<xsl:template match="sayu_tekki/tekki/nettalin">
		<xsl:if test="@làkk='fr'">
			<span    class="fra">
				<xsl:apply-templates/>
			</span>
		</xsl:if>
</xsl:template>



<!--   exemple -> misaal -->
<xsl:template match="sayu_tekki/misaal">
    <p>	
		<span    class="legende">Exemple d'usage : </span>
		<blockquote    class="example">
			<xsl:apply-templates/>
		</blockquote>
	</p>
</xsl:template>


<!--   version -> nettalin -->
<xsl:template match="sayu_tekki/misaal/nettalin">
		<xsl:if test="@làkk= 'wo' ">
			<span    class="wo">
				<xsl:apply-templates/>
			</span>
		</xsl:if>
		<xsl:if test="@làkk= 'fr' ">
			<span    class="fra">
				<xsl:apply-templates/>
			</span>
		</xsl:if>
</xsl:template>


<!--   expression -> guddalinu_méngale(bind, maas?, tëggin?, xeet?, weneen_waxin?, tekki, misaal*) -->
<xsl:template match="sayu_tekki/guddalinu_méngale">
    <p>	
		<span    class="legende">Expression : </span>
		<blockquote    class="???">
			<xsl:apply-templates/>
		</blockquote>
	</p>
</xsl:template>

<!--  forme  -> bind -->
<xsl:template match="sayu_tekki/guddalinu_méngale/bind">
<p>
		<span    class="legende">Forme : </span>
		<span    class="pos">
			<xsl:apply-templates/>
		</span>
</p>
</xsl:template>

<!--  classe  -> maas -->
<xsl:template match="sayu_tekki/guddalinu_méngale/maas">
     <p>	
		<span    class="legende">Classe : </span>
		<span    class="pos">
			<xsl:apply-templates/>
		</span>
	</p>
</xsl:template>

<!--  phonetique  -> tëggin -->
<xsl:template match="sayu_tekki/guddalinu_méngale/tëggin">
    <span    class="pronunciation">[
		<xsl:apply-templates/>]
	</span>
</xsl:template>

<!--  categorie grammaticale  -> xeet -->
<xsl:template match="sayu_tekki/guddalinu_méngale/xeet">
     <p>	
		<span    class="legende">Catégorie grammaticale : </span>
		<span    class="pos">
			<xsl:apply-templates/>
		</span>
	</p>
</xsl:template>

<!--  variante  -> weneen_waxin -->
<xsl:template match="sayu_tekki/guddalinu_méngale/weneen_waxin">
    <p>	
		<span    class="legende">Variante : </span>
		<xsl:if    test="@jokkukaay">
			<a>
				<xsl:attribute    name="href">javascript:queryOneKey('cdm-entry-id','<xsl:apply-templates    select="@jokkukaay"/>','DiLAF_wol_fra')</xsl:attribute>
				<xsl:apply-templates/>
			</a>
		</xsl:if>
		<xsl:if    test="not(@jokkukaay)">
			<xsl:apply-templates/>
		</xsl:if>
	</p>
</xsl:template>


<!--  equivalent  -> tekki -->
<xsl:template match="sayu_tekki/guddalinu_méngale/tekki">	
   <xsl:if    test="text()!=''">
		<p>
			<span    class="legende">Équivalent français : </span>
				<xsl:apply-templates/>
		</p>
    </xsl:if>	
</xsl:template>

<!--   version -> nettalin -->
<xsl:template match="sayu_tekki/guddalinu_méngale/tekki/nettalin">
		<xsl:if test="@làkk='wo'">
			<span    class="wo">
				<xsl:apply-templates/>
			</span>
		</xsl:if>
		<xsl:if test="@làkk='fr'">
			<span    class="fra">
				<xsl:apply-templates/>
			</span>
		</xsl:if>
</xsl:template>


<!--  exemple -> misaal -->
<xsl:template match="sayu_tekki/guddalinu_méngale/misaal">
    <p>	
		<span    class="legende">Exemple d'usage : </span>
		<blockquote    class="example">
			<xsl:apply-templates/>
		</blockquote>
	</p>
</xsl:template>


<!--   version -> nettalin -->
<xsl:template match="sayu_tekki/guddalinu_méngale/misaal/nettalin">
		<xsl:if test="@làkk='wo'">
			<span    class="wo">
				<xsl:apply-templates/>
			</span>
		</xsl:if>
		<xsl:if test="@làkk='fr'">
			<span    class="fra">
				<xsl:apply-templates/>
			</span>
		</xsl:if>
</xsl:template>

<!--   proverbe -> léebu(bind, firi*) -->
<xsl:template match="sayu_tekki/léebu">
    <p>	
		<span    class="legende">Proverbe : </span>
		<span    class="???">
			<xsl:apply-templates/>
		</span>
	</p>
</xsl:template>

<!--  forme -> bind -->
<xsl:template match="sayu_tekki/léebu/bind">
		<xsl:value-of select="text()"/>
</xsl:template>

<!--  traduction du proverbe -> firi(bind, firi*) -->
<xsl:template match="sayu_tekki/léebu/firi">
     <p>	
		<xsl:if test="@làkk='fr'">
			<span    class="fra">
				<xsl:apply-templates/>
			</span>
		</xsl:if>
	</p>
</xsl:template>

<!--  version littérale -> nettalinutekki -->
<xsl:template match="sayu_tekki/léebu/firi/nettalinutekki">
     <p>	
		<span    class="legende">Version littérale : </span>
		<span    class="pos">
			<xsl:apply-templates/>
		</span>
	</p>
</xsl:template>


<!--   explication -> faramfacce -->
<xsl:template match="sayu_tekki/léebu/firi/faramfacce">
      <p>	
		<span    class="legende">Explication : </span>
		<span    class="pos">
			<xsl:apply-templates/>
		</span>
	</p>
</xsl:template>



<!--  idiome -> moomeelu_làkk(bind, xeet?, weneen_waxin?, tekki?, misaal*, léebu*) -->
<xsl:template match="sayu_tekki/moomeelu_làkk">
    <p>	
		<span    class="legende">Idiome : </span>
		<span    class="???">
			<xsl:apply-templates/>
		</span>
	</p>
</xsl:template>

<!--  forme  -> bind -->
<xsl:template match="sayu_tekki/moomeelu_làkk/bind ">
		<xsl:value-of select="text()"/>
</xsl:template>

<!--  categorie grammaticale  -> xeet -->
<xsl:template match="sayu_tekki/moomeelu_làkk/xeet">
    <p>	
		<span    class="legende">Catégorie grammaticale : </span>
		<span    class="pos">
			<xsl:apply-templates/>
		</span>
	</p>
</xsl:template>

<!--  variante  -> weneen_waxin -->
<xsl:template match="sayu_tekki/moomeelu_làkk/weneen_waxin">
    <p>	
		<span    class="legende">Variante : </span>
		<xsl:if    test="@jokkukaay">
			<a>
				<xsl:attribute    name="href">javascript:queryOneKey('cdm-entry-id','<xsl:apply-templates    select="@jokkukaay"/>','DiLAF_wol_fra')</xsl:attribute>
				<xsl:apply-templates/>
			</a>
		</xsl:if>
		<xsl:if    test="not(@jokkukaay)">
			<xsl:apply-templates/>
		</xsl:if>
	</p>
</xsl:template>

<!--  equivalent  -> tekki -->
<xsl:template match="sayu_tekki/moomeelu_làkk/tekki">	
   <xsl:if    test="text()!=''">
		<p>
			<span    class="legende">Équivalent français : </span>
			<span    class="fra">
				<xsl:apply-templates/>
			</span>
		</p>
    </xsl:if>	
</xsl:template>

<!--   version -> nettalin -->
<xsl:template match="sayu_tekki/moomeelu_làkk/tekki/nettalin">
    <p>	
		<xsl:if test="@làkk= 'wo' ">
			<span    class="wo">
				<xsl:apply-templates/>
			</span>
		</xsl:if>
		<xsl:if test="@làkk= 'fr' ">
			<span    class="fra">
				<xsl:apply-templates/>
			</span>
		</xsl:if>
	</p>
</xsl:template>


<!--  exemple -> misaal -->
<xsl:template match="sayu_tekki/moomeelu_làkk/misaal">
    <p>	
		<span    class="legende">Exemple d'usage : </span>
		<span    class="example">
			<xsl:apply-templates/>
		</span>
	</p>
</xsl:template>


<!--   version -> nettalin -->
<xsl:template match="sayu_tekki/moomeelu_làkk/misaal/nettalin">
    <p>	
		<xsl:if test="@làkk= 'wo' ">
			<span    class="wo">
				<xsl:apply-templates/>
			</span>
		</xsl:if>
		<xsl:if test="@làkk= 'fr' ">
			<span    class="fra">
				<xsl:apply-templates/>
			</span>
		</xsl:if>
	</p>
</xsl:template>




<!--   proverbe -> léebu(bind, firi*) -->
<xsl:template match="sayu_tekki/moomeelu_làkk/léebu">
	<p>	
		<table border="0">
			<font face="arial" color="tan"><b> Proverbe : </b></font>
			<xsl:apply-templates />
		</table> 
	</p>
</xsl:template>

<!--  forme -> bind -->
<xsl:template match="sayu_tekki/moomeelu_làkk/léebu/bind">
		<xsl:value-of select="text()"/>
</xsl:template>

<!--  traduction du proverbe -> firi(bind, firi*) -->
<xsl:template match="sayu_tekki/moomeelu_làkk/léebu/firi">
     <p>	
		<xsl:if test="@làkk='fr'">
			<span    class="fra">
				<xsl:apply-templates/>
			</span>
		</xsl:if>
	</p>
</xsl:template>

<!--  version littérale -> nettalinutekki -->
<xsl:template match="sayu_tekki/moomeelu_làkk/léebu/firi/nettalinutekki">
    <p>	
		<span    class="legende">Version littérale : </span>
		<span    class="pos">
			<xsl:apply-templates/>
		</span>
	</p>
</xsl:template>


<!--   explication -> faramfacce -->
<xsl:template match="sayu_tekki/moomeelu_làkk/léebu/firi/faramfacce">
    <p>	
		<span    class="legende">Explication : </span>
		<span    class="pos">
			<xsl:apply-templates/>
		</span>
	</p>
</xsl:template>


<!--   synonyme -> bokk_tekki -->
<xsl:template match="sayu_tekki/bokk_tekki">
    <p>	
		<span    class="legende">Synonyme : </span>
		<xsl:if    test="@jokkukaay">
			<a>
				<xsl:attribute    name="href">javascript:queryOneKey('cdm-entry-id','<xsl:apply-templates    select="@jokkukaay"/>','DiLAF_wol_fra')</xsl:attribute>
				<xsl:apply-templates/>
			</a>
		</xsl:if>
		<xsl:if    test="not(@jokkukaay)">
			<xsl:apply-templates/>
		</xsl:if>
	</p>
</xsl:template>

<!--   antonyme -> safaan -->
<xsl:template match="sayu_tekki/safaan">
    <p>	
		<span    class="legende">Antonyme : </span>
		<xsl:if    test="@jokkukaay">
			<a>
				<xsl:attribute    name="href">javascript:queryOneKey('cdm-entry-id','<xsl:apply-templates    select="@jokkukaay"/>','DiLAF_wol_fra')</xsl:attribute>
				<xsl:apply-templates/>
			</a>
		</xsl:if>
		<xsl:if    test="not(@jokkukaay)">
			<xsl:apply-templates/>
		</xsl:if>
	</p>
</xsl:template>


<!--   cf. -> xoolal -->
<xsl:template match="sayu_tekki/xoolal">
    <p>	
		<span    class="legende">Antonyme : </span>
		<xsl:if    test="@jokkukaay">
			<a>
				<xsl:attribute    name="href">javascript:queryOneKey('cdm-entry-id','<xsl:apply-templates
 select="@jokkukaay"/>','DiLAF_wol_fra')</xsl:attribute>
				<xsl:apply-templates/>
			</a>
		</xsl:if>
		<xsl:if    test="not(@jokkukaay)">
			<xsl:apply-templates/>
		</xsl:if>
	</p>
</xsl:template>

l:template>


</xsl:stylesheet>
