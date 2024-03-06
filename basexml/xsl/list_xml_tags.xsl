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

<xsl:output method="xml" encoding="us-ascii" indent="yes" omit-xml-declaration="yes"/> <!-- omit-xml-declaration="yes"-->
	<xsl:template match="/">
		<root><xsl:text disable-output-escaping="yes">&#13;</xsl:text>	
		<xsl:for-each select="*">
			<!-- Getting the value of the 1st level child tags & parent tags-->
		        <tag><xsl:attribute name="name"><xsl:value-of select="name(.)"/></xsl:attribute><xsl:text disable-output-escaping="yes">&#13;</xsl:text>
			<xsl:for-each select="./*">
		        	<child><xsl:attribute name="name"><xsl:value-of select="name(.)"/></xsl:attribute></child><xsl:text disable-output-escaping="yes">&#13;</xsl:text>
	        	</xsl:for-each>
			</tag><xsl:text disable-output-escaping="yes">&#13;</xsl:text>

			<!-- Getting the value of the 2nd level child tags & parent tags-->
			<xsl:for-each select="*">
			<tag><xsl:attribute name="name"><xsl:value-of select="name(.)"/></xsl:attribute>
		        <xsl:for-each select="./*">
				<xsl:if test="count(preceding-sibling::node()[name()=name(current())])=0">
					<child><xsl:attribute name="name"><xsl:value-of select="name(.)"/></xsl:attribute></child><xsl:text disable-output-escaping="yes">&#13;</xsl:text>
				</xsl:if>
		        </xsl:for-each>
			</tag><xsl:text disable-output-escaping="yes">&#13;</xsl:text>

			<!-- Getting the value of the other level child tags & parent tags-->
			<xsl:for-each select=".//*">
				<!--xsl:if test="count(preceding::node()[name(.)=name(current())])=0"-->
					<tag><xsl:attribute name="name"><xsl:value-of select="name(.)"/></xsl:attribute>
			<xsl:for-each select="child::*">
				<xsl:if test="count(preceding-sibling::node()[name(.)=name(current())])=0">
	              	 		<child><xsl:attribute name="name"><xsl:value-of select="name(.)"/></xsl:attribute></child><xsl:text disable-output-escaping="yes">&#13;</xsl:text>
				</xsl:if>
			</xsl:for-each></tag><xsl:text disable-output-escaping="yes">&#13;</xsl:text>
			<!--/xsl:if-->
			</xsl:for-each>
		</xsl:for-each>
		</xsl:for-each>

 		<xsl:call-template name="getFileName">
        		<xsl:with-param name="filename" select="tokenize(document-uri(.), '/')[last()]"/>
		</xsl:call-template>
	</root>
	</xsl:template>

	<xsl:template name="getFileName">
	<xsl:param name="filename"/>
	<xsl:param name="jid"/>
	<xsl:param name="aid"/>

	<xsl:choose>
	    <xsl:when test="contains($filename, '.')">
	    <xsl:call-template name="getFileName">
	      <xsl:with-param name="filename" select="substring-before($filename, '.')"/>
	      <xsl:with-param name="jid" select="substring-before($filename, '_')"/>
	      <xsl:with-param name="aid" select="replace($filename,'^(.*?)(\p{N}+)(.*?)$','$2')"/>
	    </xsl:call-template>
	    </xsl:when>
	    <xsl:otherwise>
	      <files><xsl:text disable-output-escaping="yes">&#13;</xsl:text> 	
	      <file><xsl:attribute name="jid"><xsl:value-of select="$jid"/></xsl:attribute><xsl:attribute name="aid"><xsl:value-of select="$aid"/></xsl:attribute></file>
	      </files><xsl:text disable-output-escaping="yes">&#13;</xsl:text>
	    </xsl:otherwise>
	  </xsl:choose>
	</xsl:template>
</xsl:stylesheet>
