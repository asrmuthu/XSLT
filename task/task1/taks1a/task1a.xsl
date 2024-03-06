<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html> 
            <body>
                <h2>My CD Collection</h2>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <th style="text-align:left">Employee Name</th>
                        <th style="text-align:left">Designation</th>
                        <th style="text-align:left">Date of Joining</th>
                        <th style="text-align:left">Address</th>
                        <th style="text-align:left">Salary</th>
                    </tr>
                    <xsl:for-each select="catalog/EmployeeDetails">
                        <tr>
                            <td><xsl:value-of select="EmployeeName"/></td>
                            <td><xsl:value-of select="Designation"/></td>
                            <td><xsl:value-of select="DateofJoining"/></td>
                            <td><xsl:value-of select="Address"/></td>
                            <td><xsl:value-of select="salary"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

