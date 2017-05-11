<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html" encoding="UTF-8"/>
    <xsl:variable name="cabeceraTabla">
        <tr>
            <th colspan="3">Socio</th>
            <th colspan="2">Categoria</th>
            <th colspan="1">Edad</th>
            <th colspan="2">Cuota base</th>
            <th colspan="2">Cuotas debidas</th>
            <th colspan="2">Acceso</th>
        </tr>
    </xsl:variable>
    <xsl:template match="/clubOcio">
        <html>
            <head>
                
            </head>
            <body>
                <table>
                    <xsl:copy-of select="$cabeceraTabla"/>
                    <xsl:apply-templates select="socios"/>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="socios">
        <tr>
            <td colspan="3"><xsl:value-of select="socio/apellido1"/>&#160;<xsl:value-of select="socio/apellido1"/>&#160;<xsl:value-of select="nombre"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>