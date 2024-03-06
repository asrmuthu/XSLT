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

<!--Added "id" attribute within <safetags> and <problematicparents> for Schematron validation-->
<xsl:variable name="elementsList"> 
<safetags id="L001"> 
	<!--Elsevier-->
	<item>ce:italic</item>
	<item>ce:bold</item>
	<item>ce:inf</item>
	<item>ce:sup</item>
	<item>ce:monospace</item>
	<item>ce:glyph</item>
	<item>ce:hsp</item>
	<item>ce:vsp</item>
	<item>ce:small-caps</item>
	<item>INS</item>
	<item>DEL</item>
	<item>ce:underline</item>
	<item>ce:cross-ref</item>
	<item>ce:cross-refs</item>
	<item>ce:inter-ref</item>
	<item>ce:inter-refs</item>
	<item>ce:sans-serif</item>
    <item>ce:inline-figure</item>
    <item>ce:miscellaneous</item>
    <item>ce:formula</item>
    <item>ce:section-title</item>
    <item>ce:cross-out</item>
    <!--both RSC and SJS-->
    <item>sup</item>
    <item>monospace</item>
    <item>roman</item>
    <!--SJS-->
    <item>bold</item>
    <item>italic</item>
    <item>sub</item>
    <item>sc</item>
    <item>fixed-case</item>
    <item>overline</item>
    <item>sans-serif</item>
    <item>strike</item>
    <item>underline</item>
    <item>xref</item>
    <item>x</item>
    <item>abbrev</item>
    <!--RSC-->
    <item>bi</item>
    <item>bo</item>
    <item>it</item>
    <item>inf</item>
    <item>scp</item>
    <item>sansserif</item>
    <item>ul</item>
    <item>stack</item>
    <item>fnoteref</item>
    <item>citref</item>
    <item>tableref</item>
    <item>figref</item>
    <item>schemref</item>
    <item>boxref</item>
    <item>chartref</item>
    <item>textref</item>
    <item>eqnref</item>
    <item>compoundref</item>
    <item>affref</item>
    <item>annref</item>
    <item>compname</item>
    <item>dataref</item>
    <item>extnl-dataref</item>
    <item>resourceref</item>    
</safetags>
<problematicparents id="L002">
	<item>mml</item>
</problematicparents>	
</xsl:variable>
</xsl:stylesheet>
