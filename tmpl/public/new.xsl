<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" xmlns:date="http://exslt.org/dates-and-times" version="1.0" xmlns:cham="urn:cham">
    <xsl:import href="outer_shell.xsl"/>
    <xsl:output method="html" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <xsl:call-template name="outer_shell">
            <xsl:with-param name="title">Part</xsl:with-param>
            <xsl:with-param name="content_nodeset">
                <xsl:apply-templates select="/" mode="local"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="form" mode="local">
        <xsl:call-template name="form">
            <xsl:with-param name="content">

            <div class="row">
                <div class="large-2 columns text-right" style="margin-top: 35px">
                    <xsl:apply-templates select=".//field[@key = 'pre']" mode="auto"/>
                </div>
                <div class="large-2 columns">
                    <xsl:apply-templates select=".//field[@key = 'affix']" mode="auto"/>
                </div>
                <div class="large-2 columns" style="margin-top: 35px">
                    <xsl:apply-templates select=".//field[@key = 'post']" mode="auto"/>
                </div>
                <div class="large-3 columns">
                    <xsl:apply-templates select=".//field[@key = 'definition']" mode="auto"/>
                </div>
                <div class="large-3 columns">
                    <xsl:apply-templates select=".//field[@key = 'etymology']" mode="auto"/>
                </div>
            </div>
            <div class="row">
                <div class="large-12 columns">
                    <xsl:apply-templates select=".//field[@key = 'submit']" mode="auto"/>
                </div>
            </div>

            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>
