<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- Form helper -->
    <xsl:template name="form">
        <xsl:param name="clean"/>
        <xsl:param name="content"/>
        <form action="{@uri}" method="{@method}">
            <xsl:if test=".//field[@widget = 'file']">
                <xsl:attribute name="enctype">multipart/form-data</xsl:attribute>
            </xsl:if>
            <xsl:if test="not($clean)">
                <xsl:for-each select="@*">
                    <xsl:if test="name() != 'error' and name() != 'method' and name() != 'uri'">
                        <input type="hidden" name="{concat('__form_', name())}" value="{.}"/>
                    </xsl:if>
                </xsl:for-each>
            </xsl:if>
            <xsl:if test="@error">
                <div class="alert-box alert">
                    <xsl:value-of select="@error"/>
                </div>
            </xsl:if>
            <xsl:copy-of select="$content"/>
        </form>
    </xsl:template>
    <xsl:template match="form">
        <xsl:call-template name="form">
            <xsl:with-param name="content">
                <xsl:apply-templates select=".//field" mode="auto"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    <xsl:template match="form" mode="clean">
        <xsl:call-template name="form">
            <xsl:with-param name="clean" select="1"/>
            <xsl:with-param name="content">
                <xsl:apply-templates select=".//field" mode="auto"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- Common field wrapper -->
    <xsl:template name="field-wrapper">
        <xsl:param name="field"/>
        <xsl:param name="suppress_label"/>
        <xsl:param name="prefix"/>
        <div>
            <xsl:if test="@error">
                <xsl:attribute name="class">error</xsl:attribute>
            </xsl:if>
            <xsl:if test="@display != '' and not($suppress_label)">
                <label for="{@id}">
                    <xsl:value-of select="@display"/>
                </label>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="$prefix">
                    <div class="row collapse">
                        <div class="small-2 columns">
                            <span class="prefix"><xsl:value-of select="$prefix"/></span>
                        </div>
                        <div class="small-10 columns">
                            <xsl:copy-of select="$field"/>
                        </div>
                    </div>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:copy-of select="$field"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@error">
                <small>
                    <xsl:value-of select="@error"/>
                </small>
            </xsl:if>
        </div>
    </xsl:template>

    <!-- Common input widget -->
    <xsl:template name="input">
        <xsl:param name="type"/>
        <xsl:param name="prefix"/>
        <xsl:call-template name="field-wrapper">
            <xsl:with-param name="prefix" select="$prefix"/>
            <xsl:with-param name="field">
                <input type="{$type}" id="{@id}" name="{@name}" data-widget="{$type}" value="{@value}">
                    <xsl:for-each select="attrs/@*">
                        <xsl:attribute name="{name()}">
                            <xsl:value-of select="."/>
                        </xsl:attribute>
                    </xsl:for-each>
                </input>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- Text widget -->
    <xsl:template match="field[@widget='text']" mode="auto">
        <xsl:param name="prefix"/>
        <xsl:apply-templates select="." mode="text">
            <xsl:with-param name="prefix" select="$prefix"/>
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template match="field" mode="text">
        <xsl:param name="prefix"/>
        <xsl:call-template name="input">
            <xsl:with-param name="prefix" select="$prefix"/>
            <xsl:with-param name="type">text</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- Date widget -->
    <xsl:template match="field[@widget='date']" mode="auto">
        <xsl:param name="prefix"/>
        <xsl:apply-templates select="." mode="date">
            <xsl:with-param name="prefix" select="$prefix"/>
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template match="field" mode="date">
        <xsl:param name="prefix"/>
        <xsl:call-template name="input">
            <xsl:with-param name="prefix" select="$prefix"/>
            <xsl:with-param name="type">date</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- Password widget -->
    <xsl:template match="field[@widget='password']" mode="auto">
        <xsl:param name="prefix"/>
        <xsl:apply-templates select="." mode="password">
            <xsl:with-param name="prefix" select="$prefix"/>
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template match="field" mode="password">
        <xsl:param name="prefix"/>
        <xsl:call-template name="field-wrapper">
            <xsl:with-param name="prefix" select="$prefix"/>
            <xsl:with-param name="field">
                <input type="password" id="{@id}" name="{@name}">
                    <xsl:for-each select="attrs/@*">
                        <xsl:attribute name="{name()}">
                            <xsl:value-of select="."/>
                        </xsl:attribute>
                    </xsl:for-each>
                </input>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- Textarea widget -->
    <xsl:template match="field[@widget='textarea']" mode="auto">
        <xsl:apply-templates select="." mode="textarea"/>
    </xsl:template>
    <xsl:template match="field" mode="textarea">
        <xsl:call-template name="field-wrapper">
            <xsl:with-param name="field">
                <textarea id="{@id}" name="{@name}">
                    <xsl:for-each select="attrs/@*">
                        <xsl:attribute name="{name()}">
                            <xsl:value-of select="."/>
                        </xsl:attribute>
                    </xsl:for-each>
                    <xsl:value-of select="@value"/>
                </textarea>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- Select widget -->
    <xsl:template match="field[@widget='select']" mode="auto">
        <xsl:apply-templates select="." mode="select"/>
    </xsl:template>
    <xsl:template match="field" mode="select">
        <xsl:call-template name="field-wrapper">
            <xsl:with-param name="field">
                <select id="{@id}" name="{@name}">
                    <xsl:for-each select="attrs/@*">
                        <xsl:attribute name="{name()}">
                            <xsl:value-of select="."/>
                        </xsl:attribute>
                    </xsl:for-each>
                    <xsl:variable name="value" select="@value"/>
                    <option value="">- Please Choose -</option>
                    <xsl:for-each select="choice">
                        <option value="{@value}">
                            <xsl:for-each select="attrs/@*">
                                <xsl:attribute name="{name()}">
                                    <xsl:value-of select="."/>
                                </xsl:attribute>
                            </xsl:for-each>
                            <xsl:if test="@value = $value">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="@display"/>
                        </option>
                    </xsl:for-each>
                </select>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- Radio widget -->
    <xsl:template match="field[@widget='radio']" mode="auto">
        <xsl:apply-templates select="." mode="radio"/>
    </xsl:template>
    <xsl:template match="field" mode="radio">
        <xsl:call-template name="field-wrapper">
            <xsl:with-param name="suppress_label" select="1"/>
            <xsl:with-param name="field">
                <xsl:variable name="id" select="@id"/>
                <xsl:variable name="name" select="@name"/>
                <xsl:variable name="value" select="@value"/>
                <label><xsl:value-of select="@display"/></label>
                <xsl:for-each select="choice">
                    <label>
                        <input type="radio" name="{$name}" value="{@value}">
                            <xsl:for-each select="attrs/@*">
                                <xsl:attribute name="{name()}">
                                    <xsl:value-of select="."/>
                                </xsl:attribute>
                            </xsl:for-each>
                            <xsl:if test="@value = $value">
                                <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                        </input>
                        &#160;<xsl:value-of select="@display"/>
                    </label>
                </xsl:for-each>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- Checkbox widget -->
    <xsl:template match="field[@widget='checkbox']" mode="auto">
        <xsl:apply-templates select="." mode="checkbox"/>
    </xsl:template>
    <xsl:template match="field" mode="checkbox">
        <xsl:call-template name="field-wrapper">
            <xsl:with-param name="suppress_label" select="1"/>
            <xsl:with-param name="field">
                <input type="hidden" name="{@name}" value="0"/>
                <label>
                    <input type="checkbox" name="{@name}" value="1">
                        <xsl:for-each select="attrs/@*">
                            <xsl:attribute name="{name()}">
                                <xsl:value-of select="."/>
                            </xsl:attribute>
                        </xsl:for-each>
                        <xsl:if test="number(@value)">
                            <xsl:attribute name="checked">checked</xsl:attribute>
                        </xsl:if>
                    </input>
                    &#160;<xsl:value-of select="@display"/>
                </label>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- File widget -->
    <xsl:template match="field[@widget='file']" mode="auto">
        <xsl:apply-templates select="." mode="file"/>
    </xsl:template>
    <xsl:template match="field" mode="file">
        <xsl:param name="prefix"/>
        <xsl:call-template name="input">
            <xsl:with-param name="prefix" select="$prefix"/>
            <xsl:with-param name="type">file</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- Hidden widget -->
    <xsl:template match="field[@widget='hidden']" mode="auto">
        <xsl:apply-templates select="." mode="hidden"/>
    </xsl:template>
    <xsl:template match="field" mode="hidden">
        <input type="hidden" name="{@name}" value="{@value}">
            <xsl:for-each select="attrs/@*">
                <xsl:attribute name="{name()}">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:for-each>
        </input>
    </xsl:template>

    <!-- Submit widget -->
    <xsl:template match="field[@widget='submit']" mode="auto">
        <xsl:apply-templates select="." mode="submit"/>
    </xsl:template>
    <xsl:template match="field" mode="submit">
        <input type="submit" value="{@display}" class="button">
            <xsl:for-each select="attrs/@*">
                <xsl:attribute name="{name()}">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:for-each>
            <xsl:if test="@name != ''">
                <xsl:attribute name="name">
                    <xsl:value-of select="@name"/>
                </xsl:attribute>
            </xsl:if>
        </input>
    </xsl:template>

    <!-- Email widget -->
    <xsl:template match="field[@widget='email']" mode="auto">
        <xsl:param name="prefix"/>
        <xsl:apply-templates select="." mode="email">
            <xsl:with-param name="prefix" select="$prefix"/>
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template match="field" mode="email">
        <xsl:param name="prefix"/>
        <xsl:call-template name="input">
            <xsl:with-param name="prefix" select="$prefix"/>
            <xsl:with-param name="type">email</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>
