<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">
    <xsl:template match="/clubOcio">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="Tabla" page-height="21cm" page-width="29cm">
                    <fo:region-body margin="1cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            
            <fo:page-sequence master-reference="Tabla">
                <fo:flow flow-name="xsl-region-body">
                    <fo:table border="1pt solid black" text-align="center">
                        <fo:table-column column-width="7cm"/>
                        <fo:table-column column-width="37mm" number-columns-repeated="5"/>
                        <fo:table-body border="1pt solid white">
                            <fo:table-row font-size="1.4em" font-style="bolder" background-color="darkblue" color="white" height="2cm">
                                <fo:table-cell number-columns-spanned="6" text-align="center" padding="1cm">
                                    <fo:block font-size="30">Listado de socios</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row font-size="1.4em" font-style="bolder" background-color="darkblue" color="white" >
                                <fo:table-cell border="1pt solid white">
                                    <fo:block padding="5mm">Socio</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid white">
                                    <fo:block padding="5mm">Categoria</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid white">
                                    <fo:block padding="5mm">Edad</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid white">
                                    <fo:block padding="5mm">Cuota base</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid white">
                                    <fo:block>Cuotas debidas</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="1pt solid white">
                                    <fo:block padding="5mm">Acceso</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <xsl:apply-templates select="socios/socio"/>
                        </fo:table-body>
                    </fo:table>
                </fo:flow>
            </fo:page-sequence>
            
        </fo:root>
    </xsl:template>
    <xsl:template match="socio">
        <xsl:variable name="tipoSocio" select="@tipo"/>
        <fo:table-row background-color="#a9f5e1" height="1cm">
            <fo:table-cell border="1pt solid white">
                <fo:block padding="1cm">
                    <xsl:value-of select="apellido1"/>&#160;<xsl:value-of select="apellido1"/>&#160;<xsl:value-of select="nombre"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell border="1pt solid white">
                <fo:block padding="1cm">
                    <xsl:value-of select="@tipo"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell border="1pt solid white">
                <fo:block padding="1cm">
                    <xsl:value-of select="year-from-date(current-date())-number(fecha_nacimiento/@año)"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell border="1pt solid white">
                <fo:block padding="1cm">
                    <xsl:value-of select="format-number(number(../../cuotas/base/@valor)*(1+number(../../cuotas/cuota[@tipo=$tipoSocio]/incremento)), '##.00')"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell border="1pt solid white">
                <fo:block padding="1cm">
                    <xsl:value-of select="number(coutasDebidas)"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell border="1pt solid white">
                <xsl:choose>
                    <xsl:when test="number(cuotasDebidas)>=2"><fo:block padding="1cm">DENEGADO</fo:block></xsl:when>
                    <xsl:otherwise><fo:block padding="1cm">PERMITIDO</fo:block></xsl:otherwise>
                </xsl:choose>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>
</xsl:stylesheet>