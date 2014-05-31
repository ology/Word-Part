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
      <div class="large-5 columns">
        <h2>Word Parse</h2>
      </div>
<div style="margin-top: 10px">
      <div class="large-2 columns">
        <form action="/parse/" method="post">
            <input type="text" name="word" placeholder="Parse" value="{/response/word/@word}"/>
        </form>
      </div>
      <div class="large-1 columns">
        <a href="/" title="Reset part list" class="button tiny">Reset</a>
      </div>
      <div class="large-3 columns">
        <form action="" method="post">
            <input type="text" name="term" placeholder="Affix or Definition" />
        </form>
      </div>
      <div class="large-1 columns">
        <a href="/new" title="New part" class="button tiny">New</a>
      </div>
</div>
    </div>
    <div class="row">
      <div class="large-12 columns">
        <xsl:call-template name="paged_results">
            <xsl:with-param name="results_node" select="/response/parts"/>
        </xsl:call-template>
      </div>
    </div>

 </xsl:template>

 <xsl:template name="paged_data">

    <div class="row">
            <div class="large-4 columns">
                <h4>Score</h4>
            </div>
            <div class="large-4 columns">
                <h4>Partition</h4>
            </div>
            <div class="large-4 columns">
                <h4>Definition</h4>
            </div>
    </div>
    <hr/>
    <xsl:for-each select="/response/parts/part">
    <div class="row">
            <div class="large-4 columns">
                <p><xsl:value-of select="part/@score"/></p>
            </div>
            <div class="large-4 columns">
                <p><xsl:value-of select="part/@partition"/></p>
            </div>
            <div class="large-4 columns">
                <p><xsl:value-of select="part/@definition"/></p>
            </div>
    </div>
    <hr/>
    </xsl:for-each>

 </xsl:template>

</xsl:stylesheet>
