<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template name="content">
    <xsl:param name="id"/>
    <xsl:param name="page" select="'none'"/>
    <div id="{$id}" data-content-key="{$id}" data-content-page="{$page}"><img src="/img/loading.gif"/></div>
    <xsl:choose>
    <!-- TODO once a login is performed from admin we need to set this! to enable it -->
    <xsl:when test="/response/append/@sudo = '1'">
        <p>todo: replace editor</p>
    </xsl:when>
    <xsl:otherwise>
    </xsl:otherwise>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>
