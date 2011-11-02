<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/forum-thread-list.xsl"/>
<xsl:import href="../utilities/forum-filter.xsl"/>
<xsl:import href="../utilities/forum-categories.xsl"/>
<xsl:import href="../utilities/forum-actions.xsl"/>
<xsl:import href="../utilities/master.xsl"/>

<xsl:variable name="forum-category" select="''"/>
    
<xsl:template name="main">
    <h4>Filter All Discussions: <xsl:value-of select="$forum-filter"/></h4>
    <xsl:call-template name="forum-list">
        <xsl:with-param name="filter" select="$forum-filter"/>
    </xsl:call-template>
</xsl:template>

<xsl:template name="side-context">
    <xsl:apply-templates select="data/forum-categories"/>
    <xsl:if test="/data/events/member-login-info/@logged-in = 'yes'">
        <xsl:call-template name="forum-filter"/>
        <xsl:call-template name="forum-actions"/>
    </xsl:if>
</xsl:template>

</xsl:stylesheet>