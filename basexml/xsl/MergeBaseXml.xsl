<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:exsl="http://exslt.org/common"
		xmlns:xlink="http://www.w3.org/1999/xlink"
		xmlns:tb="http://www.elsevier.com/xml/common/table/dtd"
		xmlns:ce="http://www.elsevier.com/xml/common/dtd"
		xmlns:sb="http://www.elsevier.com/xml/common/struct-bib/dtd"                         
		xmlns:mml="http://www.w3.org/1998/Math/MathML"
		xmlns:uc="http://www.elsevier.com/xml/apps/qc/uc"		
		xmlns:cals="http://www.elsevier.com/xml/common/cals/dtd"
		xmlns:sa="http://www.elsevier.com/xml/common/struct-aff/dtd"
		exclude-result-prefixes="xsl exsl xlink tb ce sb mml uc cals sa"
		>
<xsl:output method="xml" encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:param name="pSpecific"/>

<xsl:template match="node()|@*">
    <xsl:copy>
     <xsl:apply-templates select="@* | node()" />
    </xsl:copy>
</xsl:template>

<xsl:template match="root">
    <xsl:copy>
        <xsl:apply-templates select="@* | node()" />
		<xsl:apply-templates select="$pSpecific//root/child::*"/>
    </xsl:copy>
</xsl:template>

</xsl:stylesheet>
