<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" indent="yes" />


    <xsl:template name="titleLen">
        <xsl:for-each
            select="//gry/gra">
            <xsl:sort select="string-length(tytul)" data-type="number" order="ascending" />
            <xsl:if
                test="position()=last()">
                <xsl:value-of select="string-length(tytul)" />
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:variable name="longestTitle">
        <xsl:call-template name="titleLen"></xsl:call-template>
    </xsl:variable>

    <xsl:template name="opisLen">
        <xsl:for-each
            select="//gry/gra">
            <xsl:sort select="string-length(opis)" data-type="number" order="ascending" />
            <xsl:if
                test="position()=last()">
                <xsl:value-of select="string-length(opis)" />
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:variable name="longestOpis">
        <xsl:call-template name="opisLen"></xsl:call-template>
    </xsl:variable>

    <xsl:template name="dataLen">
        <xsl:for-each
            select="//gry/gra">
            <xsl:sort select="string-length(dataWydania)" data-type="number" order="ascending" />
            <xsl:if
                test="position()=last()">
                <xsl:value-of select="string-length(dataWydania)" />
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:variable name="longestData">
        <xsl:call-template name="dataLen"></xsl:call-template>
    </xsl:variable>

    <xsl:variable name="spaces">
        <xsl:value-of
            select="'&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;'"></xsl:value-of>
    </xsl:variable>


    <xsl:variable name="nazwa">
        <xsl:value-of select="'tytul'"></xsl:value-of>
    </xsl:variable>

    <xsl:variable name="opis">
        <xsl:value-of select="'opis'"></xsl:value-of>
    </xsl:variable>

    <xsl:variable name="data">
        <xsl:value-of select="'dataWydania'"></xsl:value-of>
    </xsl:variable>


    <xsl:template match="/">
        <xsl:variable name="nazwaF"
            select="concat($nazwa, substring($spaces, 0, $longestTitle - string-length($nazwa) + 1),' | ')" />
        <xsl:variable
            name="opisF"
            select="concat($opis, substring($spaces, 0, $longestOpis - string-length($opis) + 1),' | ')" />
        <xsl:variable
            name="dataF"
            select="concat($data, substring($spaces, 0, $longestData - string-length($data) + 1),' | ')" />
       

        <xsl:value-of select="'+'" />

        <xsl:for-each
            select="(//*)[position()&lt;=string-length($nazwaF)-1]">
            <xsl:value-of select="'-'" />
        </xsl:for-each>
        <xsl:value-of select="'+'" />
        <xsl:for-each
            select="(//*)[position()&lt;=string-length($opisF)-1]">
            <xsl:value-of select="'-'" />
        </xsl:for-each>
        <xsl:value-of select="'+'" />
        <xsl:for-each
            select="(//*)[position()&lt;=string-length($dataF)-1]">
            <xsl:value-of select="'-'" />
        </xsl:for-each>
        <xsl:value-of select="'+'" />
        
        <xsl:value-of
            select="'&#10;'" />


        <xsl:value-of
            select="concat('| ',$nazwaF,$opisF, $dataF)" />
        <xsl:value-of
            select="'&#10;'" />
            
        <xsl:value-of select="'+'" />

        <xsl:for-each
            select="(//*)[position()&lt;=string-length($nazwaF)-1]">
            <xsl:value-of select="'-'" />
        </xsl:for-each>
        <xsl:value-of select="'+'" />
        <xsl:for-each
            select="(//*)[position()&lt;=string-length($opisF)-1]">
            <xsl:value-of select="'-'" />
        </xsl:for-each>
        <xsl:value-of select="'+'" />
        <xsl:for-each
            select="(//*)[position()&lt;=string-length($dataF)-1]">
            <xsl:value-of select="'-'" />
        </xsl:for-each>
        <xsl:value-of select="'+'" />

        <xsl:for-each
            select="//gry/gra">
            <xsl:variable name="gameTitle"
                select="concat(tytul, substring($spaces, 0, $longestTitle - string-length(tytul) + 1), ' | ')" />
            <xsl:variable
                name="gameOpis"
                select="concat(opis, substring($spaces, 0, $longestOpis - string-length(opis) + 1), ' | ')" />
            <xsl:variable
                name="gameData"
                select="concat(dataWydania, substring($spaces, 0, $longestData - string-length(dataWydania ) + 1), ' | ')" />

            <xsl:value-of
                select="'&#10;'" />

            <xsl:value-of
                select="concat('| ',$gameTitle,$gameOpis,$gameData)" />
            <xsl:value-of
                select="'&#10;'" />
                <xsl:value-of select="'+'" />
            <xsl:for-each
                select="(//*)[position()&lt;=string-length($gameTitle)-1]">
                <xsl:value-of select="'-'" />
            </xsl:for-each>
        <xsl:value-of select="'+'" />
        <xsl:for-each
                select="(//*)[position()&lt;=string-length($gameOpis)-1]">
                <xsl:value-of select="'-'" />
            </xsl:for-each>
        <xsl:value-of select="'+'" />
        <xsl:for-each
                select="(//*)[position()&lt;=string-length($gameData)-1]">
                <xsl:value-of select="'-'" />
            </xsl:for-each>
        <xsl:value-of select="'+'" />

        </xsl:for-each>
        <xsl:value-of
            select="'&#10;'" />

    </xsl:template>

</xsl:stylesheet>