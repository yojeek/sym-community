<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/forum-thread-list.xsl"/>
<xsl:import href="../utilities/forum-actions.xsl"/>
<xsl:import href="../utilities/forum-filter.xsl"/>
<xsl:import href="../utilities/forum-categories.xsl"/>
<xsl:import href="../utilities/master.xsl"/>

<xsl:template name="main">
    <xsl:choose>
        <xsl:when test="$forum-category = ''">
            <h4>Discussions: All categories</h4>
        </xsl:when>
        <xsl:otherwise>
            <h4>Discussions: <xsl:value-of select="/data/forum-categories/entry/name[@handle = $forum-category]"/></h4>
        </xsl:otherwise>
    </xsl:choose>

    <xsl:call-template name="forum-list">
        <xsl:with-param name="filter" select="$forum-filter"/>
    </xsl:call-template>
</xsl:template>


<xsl:template name="side-context">
    <xsl:apply-templates select="data/forum-categories">
        <xsl:with-param name="category-id" select="$forum-category"/>
    </xsl:apply-templates>
    <xsl:if test="/data/events/member-login-info/@logged-in = 'yes'">
        <xsl:call-template name="forum-filter"/>
        <xsl:call-template name="forum-actions"/>
    </xsl:if>
</xsl:template>

</xsl:stylesheet>