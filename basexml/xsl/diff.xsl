<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="pSpecific"/>
    <xsl:key name="tagnamewithattr" match="tag" use="concat(name(),'+',@name)"/>
    <xsl:key name="childnamewithattr" match="child" use="concat(name(..),'+',../@name,'+',name(),'+',@name)"/>
    <xsl:include href="IgnoreStyleTags.xsl"/>
    
    <xsl:output omit-xml-declaration="yes"/>

    <xsl:template match="node()|@*" name="identity">
            <xsl:apply-templates select="node()|@*"/>
    </xsl:template>

    <xsl:template match="tag">
        <xsl:param name="pSource" select="$pSpecific"/>
        <xsl:param name="pCopy" select="true()"/>
        <xsl:variable name="vCurrent" select="."/>
        <xsl:variable name="safetags">
            <xsl:text>^(</xsl:text><xsl:value-of select="string-join($elementsList/safetags/item,'|')"/><xsl:text>)$</xsl:text> 
            </xsl:variable>
		<xsl:variable name="problematicparents">
			<xsl:value-of select="string-join($elementsList/problematicparents/item,'|')"/>	
		</xsl:variable> 
		 
    <xsl:for-each select="$pSource">
	<xsl:variable name="vMatch"
                          select="key('tagnamewithattr',
                                      concat(name($vCurrent),'+',
                                             $vCurrent/@name))"/>
                                             
        <xsl:for-each select="$vCurrent[$vMatch]">
			<xsl:apply-templates/>
        </xsl:for-each>
         
        <xsl:for-each select="$vCurrent[not($vMatch)]">
		<xsl:choose>
		<xsl:when test="contains(name($vCurrent),'child')">
		<xsl:message><xsl:value-of select="name($vCurrent)"/> - <xsl:value-of select="$vCurrent/@name"/> [Parent - <xsl:value-of select="parent::*/@name" />]</xsl:message>
		</xsl:when>       
		<xsl:when test="not(matches($vCurrent/@name,$safetags) or contains($vCurrent/@name,$problematicparents))">
			<xsl:message><xsl:value-of select="name($vCurrent)"/> - <xsl:value-of select="$vCurrent/@name"/></xsl:message>
		</xsl:when>
		</xsl:choose>
	        <xsl:apply-templates/>
        </xsl:for-each>
            <xsl:for-each select="$vMatch[not($pCopy)]">
                <xsl:call-template name="identity"/>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="child">
        <xsl:param name="pSource" select="$pSpecific"/>
        <xsl:param name="pCopy" select="true()"/>
        <xsl:variable name="vCurrent" select="."/>
        <xsl:variable name="safetags">
			<xsl:text>^(</xsl:text><xsl:value-of select="string-join($elementsList/safetags/item,'|')"/><xsl:text>)$</xsl:text>	
		</xsl:variable>
		<xsl:variable name="problematicparents">
			<xsl:value-of select="string-join($elementsList/problematicparents/item,'|')"/>	
		</xsl:variable> 
		<xsl:for-each select="$pSource">
		<xsl:variable name="vMatch"
                          select="key('childnamewithattr',
                                      concat(name($vCurrent/..),'+',$vCurrent/../@name,'+',name($vCurrent),'+',
                                             $vCurrent/@name))"/>
                                             
        <xsl:for-each select="$vCurrent[$vMatch]">
			<xsl:apply-templates/>
        </xsl:for-each>	
        <xsl:for-each select="$vCurrent[not($vMatch)]">
		<xsl:choose>
		
		<!--xsl:when test="matches($vCurrent/@name,$safetags) and parent::*[@name = $problematicparents]">
			<xsl:message><xsl:value-of select="name($vCurrent)"/> - <xsl:value-of select="$vCurrent/@name"/> [Parent - <xsl:value-of select="parent::*/@name" />]</xsl:message>
		</xsl:when-->
		
		<xsl:when test="not(matches($vCurrent/@name,$safetags) or contains($vCurrent/@name,$problematicparents) or $vCurrent[parent::*[@name[starts-with(.,$problematicparents)]]])">
				<xsl:message><xsl:value-of select="name($vCurrent)"/> - <xsl:value-of select="$vCurrent/@name"/> [Parent - <xsl:value-of select="parent::*/@name" />]</xsl:message>
		</xsl:when>	
		</xsl:choose>
	        <xsl:apply-templates/>
        </xsl:for-each>
            <xsl:for-each select="$vMatch[not($pCopy)]">
                <xsl:call-template name="identity"/>
            </xsl:for-each>
        </xsl:for-each>
   </xsl:template>
</xsl:stylesheet>
