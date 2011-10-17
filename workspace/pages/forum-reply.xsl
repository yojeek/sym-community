<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/form-reply-form.xsl"/>
<xsl:import href="../utilities/forum-categories.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>
<xsl:import href="../utilities/master.xsl"/>

<xsl:variable name="member-is-logged-in" select="boolean(//events/member-login-info/@logged-in = 'yes')"/>

<xsl:template name="main">
	<h1><xsl:value-of select="$page-title"/></h1>
    <xsl:choose>
        <xsl:when test="$member-is-logged-in">
            <xsl:call-template name="forum-reply">
                <xsl:with-param name="reply-id" select="$reply-id"/>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <div class="thread-block">
                <h6>Please <a href="#login-form">log in</a> or <a href="{$root}/register">join the community</a> to participate in discussion.</h6>
            </div>
        </xsl:otherwise>
    </xsl:choose>    
</xsl:template>

<xsl:template name="side-context">
    <xsl:apply-templates select="/data/forum-categories"/>
</xsl:template>
    
</xsl:stylesheet>