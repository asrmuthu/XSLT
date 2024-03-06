<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
xmlns:b="http://schemas.openxmlformats.org/officeDocument/2006/bibliography"
xmlns:pkg="http://schemas.microsoft.com/office/2006/xmlPackage"
xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
xmlns:c="http://schemas.openxmlformats.org/drawingml/2006/chart"
xmlns:urn="urn:schemas-microsoft-com.VSTO2008Demos.ControlsStorage"
xmlns:tf="http://www.elsevier.com/xml/common/dtd"
xmlns:ce="http://www.elsevier.com/xml/common/dtd" xmlns:xlink="http://www.w3.org/1999/xlink" exclude-result-prefixes="#all" version="2.0">

<xsl:output method="html" indent="yes"/>

	<xsl:template match="@*|node()">
	<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy> 
	</xsl:template>
	
		
 <xsl:template match="ArticleID">

  	<xsl:value-of select="local-name()"/>
 	<xsl:value-of select="concat(':',.)"/>
			 <pre> </pre>
</xsl:template> 


 <xsl:template match="ArticleTitle">
 <pre> </pre>

	<xsl:if test="following::JournalID">
	
				<xsl:apply-templates select="following::JournalID" mode="pass_mvtfoot_HIND_1"/>
			</xsl:if>
  <pre></pre>
   <xsl:copy>
 <xsl:copy-of select="@*"/>
 	
	<xsl:apply-templates/>
			 <pre> </pre>
			</xsl:copy>
</xsl:template>



 <xsl:template match="JournalID">
 <pre></pre>
<xsl:choose>
			<xsl:when test="preceding::ArticleTitle">
			
					</xsl:when>
			<xsl:otherwise>
			<pre></pre>
				
						<xsl:value-of select="local-name()"/>
                 	<xsl:value-of select="concat(':',.)"/>	
				
			</xsl:otherwise>
		</xsl:choose>
  
			 <pre> </pre>
	
</xsl:template> 


 <xsl:template match="JournalID" mode="pass_mvtfoot_HIND_1">
<xsl:value-of select="concat(name(),' : ',.)"/>	
</xsl:template> 





<xsl:template match="ArticleSequenceNumber | ArticleFirstPage | ArticleLastPage | ArticleHistory | ArticleCopyright | ArticleDOI"/>

	 
<xsl:template match="ArticleHeader">
	 <pre> </pre>
	  <xsl:copy>
	  <xsl:copy-of select="@*"/>
<xsl:text>Pages: 1–9</xsl:text>  
<xsl:apply-templates/>
<pre> </pre> 
		
</xsl:copy>
</xsl:template>

 <xsl:template match="RunningTitle | RunningAuthor | GivenName | FamilyName">
 <pre> </pre>

  	<b><xsl:value-of select="local-name()"/></b>
	<xsl:value-of select="concat(':',.)"/>
 	  
			 <pre> </pre>
	
</xsl:template> 


<xsl:template match="Contact">
	 <pre> </pre>
	  <xsl:copy>
	  
<xsl:text>Correspondence: [Aff1]</xsl:text>  
<xsl:apply-templates/>
<pre> </pre> 
		
</xsl:copy>
</xsl:template>


 <xsl:template match="Email">
 <pre> </pre>

  	<b><xsl:value-of select="local-name()"/></b>
	<xsl:value-of select="concat(':',.)"/>
 	  
			 <pre> </pre>
	<xsl:text>Aff1</xsl:text>  
</xsl:template> 




 <xsl:template match="OrgDivision | OrgName | City | Country">
 <pre> </pre>

  	<b><xsl:value-of select="local-name()"/></b>
	<xsl:value-of select="concat(':',.)"/>
 	  
			 <pre> </pre>
	
</xsl:template> 


<xsl:template match="Heading">
<pre> </pre>
<xsl:copy>
 <xsl:copy-of select="@*"/>
  <pre> </pre>
  <h3> <xsl:apply-templates/> </h3>
  
    </xsl:copy>
  </xsl:template>


<xsl:template match="Keyword[ancestor::KeywordGroup]">

<xsl:copy>
 <xsl:copy-of select="@*"/>
<br></br>
 <xsl:apply-templates/>
  
    </xsl:copy>
  </xsl:template> 
  
  
<xsl:template match="Heading[parent::Section1]">

<xsl:copy>
 <xsl:copy-of select="@*"/>
  <pre> </pre>
  <h1><xsl:apply-templates/></h1>
  
    </xsl:copy>
  </xsl:template> 

<xsl:template match="Para[ancestor::Body]">

<xsl:copy>
 <xsl:copy-of select="@*"/>
<br></br><pre></pre>
<xsl:apply-templates/>
  
    </xsl:copy>
  </xsl:template> 





</xsl:stylesheet>
