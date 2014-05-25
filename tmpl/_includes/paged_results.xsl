<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template name="pr_pager">
        <xsl:param name="results_node"/>
        
        <xsl:variable name="other_params" select="$results_node/pager_window/@other_params"/>
        <xsl:variable name="has_previous_page" select="$results_node/@has_previous_page"/>
        <xsl:variable name="has_next_page" select="$results_node/@has_next_page"/>
        <xsl:variable name="last_page" select="$results_node/@last_page"/>
        
        <div class="row">
            <div class="large-12 columns pagination-centered">
                <ul class="pagination">
                    <xsl:if test="$has_previous_page=1">
                        <li>
                            <a href="?{$other_params}{$results_node/pager_window/page[@previous_page=1]/@page_params}">&lt;&lt;</a>
                        </li>
                    </xsl:if>
                    <xsl:if test="$last_page &gt; 1">
                        <xsl:for-each select="$results_node/pager_window/page">
                            <li>
                                <xsl:if test="@current_page=1"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
                                <a href="?{$other_params}{@page_params}"><xsl:value-of select="@page"/></a>
                            </li>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="$has_next_page=1">
                        <li>
                            <a href="?{$other_params}{$results_node/pager_window/page[@next_page=1]/@page_params}">&gt;&gt;</a>
                        </li>
                    </xsl:if>
                </ul>
            </div>
        </div>
        
    </xsl:template>
    
    <xsl:template name="paged_data">
        <xsl:param name="results_node"/>
        <table>
            <thead>
                <tr>
                    <xsl:for-each select="$results_node/rows/header/column">
                        <td>
                            <xsl:if test="@class != ''"><xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute></xsl:if>
                            <xsl:value-of select="@value"/>
                        </td>
                    </xsl:for-each>
                </tr>
            </thead>
            <tbody>
            	<xsl:choose>
            		<xsl:when test="$results_node/@total_results = 0">
		            	<tr>
		            		<td colspan="{count($results_node/rows/header/column)}">
		            			<em>No results</em>
		            		</td>
		            	</tr>	            	
		            </xsl:when>
		            <xsl:otherwise>
		                <xsl:for-each select="$results_node/rows/row">
        		            <tr>
                		        <xsl:for-each select="column">
		                            <td>
        		                        <xsl:if test="@class != ''"><xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute></xsl:if>
        	        		            <xsl:choose>
		    	                            <xsl:when test="@uri">
                			        	        <a href="{@uri}"><xsl:value-of select="@value"/></a>
                            		        </xsl:when>
			                                <xsl:otherwise>
            			    	                <xsl:value-of select="@value"/>
                        		            </xsl:otherwise>
			        	                </xsl:choose>
            		                </td>
                        		</xsl:for-each>
		                    </tr>
        		        </xsl:for-each>
        		    </xsl:otherwise>
        		</xsl:choose>
            </tbody>
        </table>
    </xsl:template>
    
    <xsl:template name="paged_results">
        <xsl:param name="results_node"/>
        
        <xsl:apply-templates select="//form[@key = name($results_node)]"/>
        
        <xsl:variable name="other_params" select="$results_node/pager_window/@other_params"/>
        
        <div class="row">
            <xsl:if test="$results_node/per_page">
                <div class="large-4 columns">
                    <dl class="sub-nav">
                        <dt>Per Page:</dt>
                        <xsl:for-each select="$results_node/per_page/option">
                            <xsl:variable name="lvalue" select="@value"/>
                            <dd>
                                <xsl:if test="//form[@key = name($results_node)]/field[@widget = 'table_per_page']/@value = $lvalue">
                                    <xsl:attribute name="class">active</xsl:attribute>
                                </xsl:if>
                                <a href="?{$other_params}{@page_params}"><xsl:value-of select="@display"/></a>
                            </dd>
                        </xsl:for-each>
                    </dl>
                </div>
            </xsl:if>
            <xsl:if test="$results_node/sort">
                <div class="large-8 columns text-right">
                    <dl class="sub-nav">
                        <dt>Sort:</dt> 
                        <xsl:for-each select="$results_node/sort/option">
                            <xsl:variable name="lvalue" select="@value"/>
                            <dd>
                                <xsl:if test="//form[@key = name($results_node)]/field[@widget = 'table_sort']/@value = $lvalue">
                                    <xsl:attribute name="class">active</xsl:attribute>
                                </xsl:if>
                                <a href="?{$other_params}{@page_params}"><xsl:value-of select="@display"/></a>
                            </dd>
                        </xsl:for-each>
                    </dl>
                </div>
            </xsl:if>
        </div>
        
        <div class="row">
            <div class="large-12 columns">
                <xsl:call-template name="paged_data">
                    <xsl:with-param name="results_node" select="$results_node"/>
                </xsl:call-template>
            </div>
        </div>
        
        <xsl:call-template name="pr_pager">
            <xsl:with-param name="results_node" select="$results_node"/>
        </xsl:call-template>
    </xsl:template>
    
</xsl:stylesheet>
