<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:cham="urn:cham">
    <xsl:import href="class://outer_shell.xsl"/>
    <xsl:output method="html" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <xsl:call-template name="outer_shell">
            <xsl:with-param name="title">Error</xsl:with-param>
            <xsl:with-param name="content_nodeset">
                <xsl:apply-templates select="/" mode="local"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="/" mode="local">
        <p><xsl:value-of select="/error/@public"/></p>
    </xsl:template>
</xsl:stylesheet>
