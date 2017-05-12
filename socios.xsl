<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html" encoding="UTF-8"/>
    <xsl:variable name="cabeceraTabla">
        <tr>
            <th>Socio</th>
            <th>Categoria</th>
            <th>Edad</th>
            <th>Cuota base</th>
            <th>Cuotas debidas</th>
            <th>Acceso</th>
        </tr>
    </xsl:variable>
    <xsl:template match="/clubOcio">
        <html>
            <head>
                <title>Tabla club ocio</title>
                <link rel="stylesheet" type="text/css" href="estilos.css"/>
            </head>
            <body>
                <table>
                    <xsl:copy-of select="$cabeceraTabla"/>
                    <xsl:apply-templates select="socios/socio"/>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="socio">
        <xsl:variable name="tipoSocio" select="@tipo"/>
        <tr>
            <td ><xsl:value-of select="apellido1"/>&#160;<xsl:value-of select="apellido1"/>&#160;<xsl:value-of select="nombre"/></td>
            <td><xsl:value-of select="@tipo"/></td>
            <td><xsl:value-of select="year-from-date(current-date())-number(fecha_nacimiento/@año)"/></td>
            <td><xsl:value-of select="format-number(number(../../cuotas/base/@valor)*(1+number(../../cuotas/cuota[@tipo=$tipoSocio]/incremento)), '##.00')"/></td>
            <td><xsl:value-of select="number(coutasDebidas)"/></td>
            <td><xsl:choose>
                <xsl:when test="number(cuotasDebidas)>=2">DENEGADO</xsl:when>
                <xsl:otherwise>PERMITIDO</xsl:otherwise>
            </xsl:choose></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>