<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="iso-8859-2" />
    <xsl:template name="data">
        <table class="tablica">
            <tr>
                <td>Tytul</td>
                <td>opis</td>
                <td>recenzja</td>
                <td>ocena</td>
                <td>data wydania</td>
                <td>wydawca</td>
            </tr>
            <xsl:for-each select="//grografia/gry/gra">
            <tr>
                <td>
                    <xsl:value-of select="tytul" />
                </td>
                <td>
                    <xsl:value-of select="opis" />
                </td>
                <td>
                    <xsl:variable name="idRecenzji" select="recenzja/@idRecenzji" />
                    <xsl:value-of select="//grografia/recenzje/recenzja[@idRecenzji = $idRecenzji]/tresc" />
                </td>
                <td>
                    <xsl:variable name="idRecenzji" select="recenzja/@idRecenzji" />
                    <xsl:value-of select="//grografia/recenzje/recenzja[@idRecenzji = $idRecenzji]/ocena" />
                </td>
                <td>
                    <xsl:value-of select="dataWydania"/>
                </td>
                 <td>
                    <xsl:variable name="idWydawcy" select="wydawca/@idWydawcy" />
                    <xsl:value-of select="//grografia/wydawcy/wydawca[@idWydawcy = $idWydawcy]/nazwa" />
                </td>
                
            </tr>
        </xsl:for-each>
        </table>

    </xsl:template>

    <xsl:template name="maxOcenka">
        <p>Najlepiej ocenione gry</p>
        <div class="podelement">
            <xsl:variable name="max">
            <xsl:for-each select="//grografia/recenzje/recenzja/ocena">
                <xsl:sort select="." data-type="number" order="descending"/>
                <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
            </xsl:for-each>
            </xsl:variable>
            <table>
                <tr>
                    <td>tytul</td>
                    <td>wydawca</td>
                </tr>
            <xsl:for-each select="//grografia/gry/gra">
                <xsl:variable name="idRecenzji" select="recenzja/@idRecenzji" />
                <xsl:if test="//grografia/recenzje/recenzja[@idRecenzji=$idRecenzji]/ocena = $max">
                    
                    <tr>
                        <td><xsl:value-of select="tytul"></xsl:value-of></td>
                        <td>
                            <xsl:variable name="idWydawcy" select="wydawca/@idWydawcy" />
                            <xsl:value-of select="//grografia/wydawcy/wydawca[@idWydawcy = $idWydawcy]/nazwa"/>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
        </table>             
    </div>
    </xsl:template>

    <xsl:template name="minOcenka">
        <p>Najgorzej ocenione gry</p>
        <div class="podelement">
            <xsl:variable name="max">
            <xsl:for-each select="//grografia/recenzje/recenzja/ocena">
                <xsl:sort select="." data-type="number" order="ascending"/>
                <xsl:if test="position() = 1"><xsl:value-of select="."/></xsl:if>
            </xsl:for-each>
            </xsl:variable>
            <table>
                <tr>
                    <td>tytul</td>
                    <td>wydawca</td>
                </tr>
            <xsl:for-each select="//grografia/gry/gra">
                <xsl:variable name="idRecenzji" select="recenzja/@idRecenzji" />
                <xsl:if test="//grografia/recenzje/recenzja[@idRecenzji=$idRecenzji]/ocena = $max">
                    
                    <tr>
                        <td><xsl:value-of select="tytul"></xsl:value-of></td>
                        <td>
                            <xsl:variable name="idWydawcy" select="wydawca/@idWydawcy" />
                            <xsl:value-of select="//grografia/wydawcy/wydawca[@idWydawcy = $idWydawcy]/nazwa"/>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:for-each>
        </table>           
    </div>
    </xsl:template>
    
    <xsl:template match="/">
        <html xml:lang="pl" lang="pl">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <!-- <link href="style.css" rel="stylesheet" type="text/css" /> -->
                <title>Transformacja do XHTML</title>
            </head>
            <body>
                <div class="contenerF">
                    <div>
                        <h3>Tabela przedstawiająca listę gier</h3>
                        <xsl:call-template name="data" />
                    </div>
                    <h3>Statystyki</h3>
                        <div class="contenerF">
                            <div>
                                <div class="podelement">
                                    <xsl:call-template name="maxOcenka"/>
                                </div>
                                <div class="podelement">
                                    <xsl:call-template name="minOcenka"/>
                                </div>
                                
                            </div>
                            
                        </div>
                    
                </div>
            </body>
        </html>
    </xsl:template>

  
</xsl:stylesheet>