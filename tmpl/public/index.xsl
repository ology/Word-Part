<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" xmlns:date="http://exslt.org/dates-and-times" xmlns:cham="urn:cham">
 <xsl:import href="class://outer_shell.xsl"></xsl:import>
 <xsl:output method="html" omit-xml-declaration="no" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes" />

 <xsl:template match="/">
  <xsl:call-template name="outer_shell">
   <xsl:with-param name="content_nodeset">
    <xsl:apply-templates select="/" mode="local"></xsl:apply-templates>
   </xsl:with-param>
  </xsl:call-template>
 </xsl:template>

 <xsl:template match="/" mode="local">

    <div class="row">
      <div class="large-8 columns">
        <div class="main_header">
            <h2>Word Parts</h2>
        </div>
      </div>
      <div class="large-4 columns">
        <p>&#160;</p>
        <input type="text" placeholder="Affix or Definition" />
      </div>
      <div class="large-12 columns">
        <p>&#160;</p>
        <xsl:call-template name="paged_results">
            <xsl:with-param name="results_node" select="/response/parts"/>
        </xsl:call-template>
      </div>
    </div>

 </xsl:template>

 <xsl:template name="paged_data">

    <div class="row">
      <div class="large-12 columns">
         <div class="row">
            <div class="large-3 columns">
                <h4>Prefix</h4>
            </div>
            <div class="large-3 columns">
                <h4>Affix</h4>
            </div>
            <div class="large-3 columns">
                <h4>Suffix</h4>
            </div>
            <div class="large-3 columns story text-right">
                <h4>Definition</h4>
            </div>
         </div>
      </div>
    </div>
    <hr/>
    <xsl:for-each select="//results/result">
    <div class="row">
      <div class="large-12 columns">
         <div class="row">
            <div class="large-3 columns">
                <p><xsl:value-of select="@prefix"/></p>
            </div>
            <div class="large-3 columns">
                <p><xsl:value-of select="@affix"/></p>
            </div>
            <div class="large-3 columns">
                <p><xsl:value-of select="@suffix"/></p>
            </div>
            <div class="large-3 columns story text-right">
                <p><xsl:value-of select="@definition" disable-output-escaping="yes"/></p>
            </div>
         </div>
      </div>
    </div>
    <hr/>
    </xsl:for-each>

 </xsl:template>

</xsl:stylesheet>
