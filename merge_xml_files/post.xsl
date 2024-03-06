<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exsl="http://exslt.org/common"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	xmlns:tb="http://www.elsevier.com/xml/common/table/dtd"
	xmlns:ce="http://www.elsevier.com/xml/common/dtd"
	xmlns:sb="http://www.elsevier.com/xml/common/struct-bib/dtd"                         
	xmlns:mml="http://www.w3.org/1998/Math/MathML"
	xmlns:uc="http://www.elsevier.com/xml/apps/qc/uc"
	xmlns:ja="http://www.elsevier.com/xml/ja/dtd"
	xmlns:cals="http://www.elsevier.com/xml/common/cals/dtd"
	xmlns:sa="http://www.elsevier.com/xml/common/struct-aff/dtd" 
	exclude-result-prefixes="xsl exsl xlink tb ce ja sb mml uc cals sa"
	version="2.0">
	
	<xsl:output method="xml" encoding="us-ascii" indent="yes" omit-xml-declaration="yes"/> 
	
	<xsl:strip-space elements="*"/>  
	
	<xsl:template match="node()|@*">  
		<xsl:copy>  
			<xsl:apply-templates select="node()|@*"/>  
		</xsl:copy>  
	</xsl:template>  
	
	<xsl:template match="files"/>
	<xsl:template match="root[parent::root]">
		<xsl:apply-templates/>  
	</xsl:template>  
</xsl:stylesheet>