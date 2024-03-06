<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	
	
	<xsl:template match="content/collection">
            <xsl:apply-templates>
                <xsl:sort select="@code" order="descending" />
            </xsl:apply-templates>
        </xsl:template>
	
</xsl:stylesheet>