<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output
        method="xml"
        indent="yes"
        doctype-public="-//W3C//DTD SVG 1.1//EN"
        media-type="image/svg" />

    <xsl:template match="/">

        <xsl:variable name="o45" select="count(//grografia/recenzje/recenzja[ocena=4.5])" />
        <xsl:variable
            name="o46" select="count(//grografia/recenzje/recenzja[ocena=4.6])" />
        <xsl:variable
            name="o47" select="count(//grografia/recenzje/recenzja[ocena=4.7])" />
        <xsl:variable
            name="o48" select="count(//grografia/recenzje/recenzja[ocena=4.8])" />
        <xsl:variable
            name="o49" select="count(//grografia/recenzje/recenzja[ocena=4.9])" />
        
        
        <svg
            xmlns="http://www.w3.org/2000/svg" width="600" height="400" style="background-color: white">
            <text x="55" y="35" fill="black" font-size="25">Ilość wystąpień gier o ocenie</text>

            <rect x="50" y="50" width="300px" height="300px" fill="blue" >
            <animate attributeName="fill" values="red;orange;yellow;green;red" dur="8s"
            repeatCount="indefinite" />
            </rect>

            <text x="20" y="280" fill="black">1</text>
            <line x1="50" y1="280" x2="40" y2="280" stroke="black" stroke-widts="2px" />

            <text x="20" y="210" fill="black">2</text>
            <line x1="50" y1="210" x2="40" y2="210" stroke="black" stroke-widts="2px" />

            <text x="20" y="140" fill="black">3</text>
            <line x1="50" y1="140" x2="40" y2="140" stroke="black" stroke-widts="2px" />

            <text x="20" y="70" fill="black">4</text>
            <line x1="50" y1="70" x2="40" y2="70" stroke="black" stroke-widts="2px" />

            <rect x="65" y="{350 - ($o45 * 70)}" width="40" height="{$o45 * 70}" stroke="black"
                stroke-widts="2px"
                fill="blue">
                
            </rect>
            <text x="70" y="380" fill="black">4.5</text>


            <rect x="120" y="{350 - ($o46 * 70)}" width="40" height="{$o46 * 70}" stroke="black"
                stroke-widts="2px"
                fill="blue">
                
            </rect>
            <text x="125" y="380" fill="black">4.6</text>

            <rect x="175" y="{350 - ($o47 * 70)}" width="40" height="{$o47 * 70}" stroke="black"
                stroke-widts="2px"
                fill="blue">
                
            </rect>
            <text x="180" y="380" fill="black">4.7</text>

            <rect x="230" y="{350 - ($o48 * 70)}" width="40" height="{$o48 * 70}" stroke="black"
                stroke-widts="2px"
                fill="blue">
                
            </rect>
            <text x="235" y="380" fill="black">4.8</text>

            <rect x="285" y="{350 - ($o49 * 70)}" width="40" height="{$o49 * 70}" stroke="black"
             stroke-widts="2px"
             fill="blue">
               
            </rect>
            <text x="290" y="380" fill="black">4.9</text>

        </svg>
    </xsl:template>
</xsl:stylesheet>