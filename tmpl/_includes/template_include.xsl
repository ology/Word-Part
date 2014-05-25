<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template name="windowed_pager">
        <xsl:choose>
            <xsl:when test="//pager/@num_pages &gt; 1">
                <div class="row">
                    <div class="large-12 columns">
                        <ul class="pagination">
                            <xsl:for-each select="//pager/pager_window">
                                <li>
                                    <xsl:if test="@current_page = 1">
                                        <xsl:attribute name="class">current</xsl:attribute>
                                    </xsl:if>
                                    <a href=".#" data-page="{@page}">
                                        <xsl:value-of select="@page"/>
                                    </a>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </div>
            </xsl:when>
            <xsl:otherwise />
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="hard_chop">
        <xsl:param name="text"/>
        <xsl:param name="length" select="'30'"/>

        <xsl:choose>
            <xsl:when test="string-length($text) &gt; $length">
                <!-- Too long -->
                <xsl:choose>
                    <xsl:when test="substring($text,$length,$length) = ' '">
                        <xsl:value-of select="substring($text,1,($length-1))" disable-output-escaping="yes"/>...
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="substring($text,1,$length)" disable-output-escaping="yes"/>...
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text" disable-output-escaping="yes"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>