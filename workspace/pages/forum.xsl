<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/forum-categories.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>
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
    <table class="forum-list m-24">
        <thead>
            <tr>
                <td class="topic"><p>Topic</p></td>
                <td class="replies"><p>Replies</p></td>
                <td class="activity-date"><p>Last active</p></td>
                <td class="activity-user"><p>Last post</p></td>
            </tr>
        </thead>
        <tbody>
            <xsl:apply-templates select="/data/forum-discussions/entry"/>
        </tbody>
    </table>
    <div class="pager-holder">
        <xsl:call-template name="pagination">
            <xsl:with-param name="pagination" select="/data/forum-discussions/pagination"/>
            <xsl:with-param name="pagination-url" select="'?page=$'"/>
            <xsl:with-param name="show-navigation" select="false"/>
            <xsl:with-param name="class-pagination" select="'pager'"/>
            <xsl:with-param name="class-selected" select="'active'"/>
        </xsl:call-template>
    </div>
</xsl:template>

<xsl:template match="/data/forum-discussions/entry">
    <tr>
        <td class="topic">
            <p><a href="/forum-discussion/{@id}"><xsl:value-of select="topic"/></a></p>
            <xsl:choose>
                <xsl:when test="$forum-category = ''">
                    <p class="sub"><xsl:value-of select="category"/></p>
                </xsl:when>
            </xsl:choose>
        </td>
        <td class="replies"><p>--</p></td>
        <td class="activity-date"><p>--</p></td>
        <td class="activity-user"><p>--</p></td>
    </tr>
</xsl:template>

<xsl:template name="side-context">
    <xsl:apply-templates select="data/forum-categories">
        <xsl:with-param name="category-id" select="$forum-category"/>
    </xsl:apply-templates>
</xsl:template>

</xsl:stylesheet>