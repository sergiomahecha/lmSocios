<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">
    <!-- master -->
    <fo:root>
        <fo:layout-master-set>
            <fo:simple-page-master master-name="Tabla">
                <fo:region-body margin="2cm"/>
            </fo:simple-page-master>
        </fo:layout-master-set>
    
        <fo:page-sequence master-reference="Tabla">
            <fo:flow flow-name="xsl-region-body">
                <fo:table border="1pt solid black" text-align="center">
                    <fo:table-body>
                        <fo:table-row font-size="1.4em" font-style="bolder">
                            <fo:table-cell number-columns-spanned="6">
                                <fo:block>Listado de socios</fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row font-size="1.4em" font-style="bolder">
                            <fo:table-cell>
                                <fo:block>Socio</fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block>Categoria</fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block>Edad</fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block>Cuota base</fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block>Cuotas debidas</fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block>Acceso</fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <xsl:apply-templates select="socios/socio"/>
                    </fo:table-body>
                </fo:table>
            </fo:flow>
        </fo:page-sequence>
        
    </fo:root>

    <xsl:template match="socio">
        <xsl:variable name="tipoSocio" select="@tipo"/>
        <fo:table-row>
            <fo:table-cell>
                <fo:block>
                    <xsl:value-of select="apellido1"/>&#160;<xsl:value-of select="apellido1"/>&#160;<xsl:value-of select="nombre"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block>
                    <xsl:value-of select="@tipo"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block>
                    <xsl:value-of select="year-from-date(current-date())-number(fecha_nacimiento/@año)"/>
                </fo:block>
            </fo:table-cell><fo:table-cell>
                <fo:block>
                    <xsl:value-of select="format-number(number(../../cuotas/base/@valor)*(1+number(../../cuotas/cuota[@tipo=$tipoSocio]/incremento)), '##.00')"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block>
                    <xsl:value-of select="number(coutasDebidas)"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block>
                    <xsl:choose>
                        <xsl:when test="number(cuotasDebidas)>=2">DENEGADO</xsl:when>
                        <xsl:otherwise>PERMITIDO</xsl:otherwise>
                    </xsl:choose>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>
</xsl:stylesheet>