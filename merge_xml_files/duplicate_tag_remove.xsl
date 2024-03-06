<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:strip-space elements="*"/>
	<!-- Define a key for each element based on its name and content -->
	<xsl:key name="element" match="*" use="concat(name(), .)" />
	
	<!-- Template to match all elements -->
	<xsl:template match="*">
		<!-- Check if the current element is the first occurrence -->
		<xsl:if test="generate-id() = generate-id(key('element', concat(name(), .))[1])">
			<!-- Copy the current element and its descendants -->
			<xsl:copy>
				<xsl:copy-of select="@*"/>
				<xsl:apply-templates select="node()"/>
			</xsl:copy>
		</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>
