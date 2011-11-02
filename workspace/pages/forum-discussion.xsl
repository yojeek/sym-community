<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/form-reply-form.xsl"/>
<xsl:import href="../utilities/forum-actions.xsl"/>
<xsl:import href="../utilities/forum-categories.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>
<xsl:import href="../utilities/master.xsl"/>

<xsl:variable name="member-is-logged-in" select="boolean(//events/member-login-info/@logged-in = 'yes')"/>
<xsl:variable name="starting-comment-number" select="(number(/data/forum-replies/pagination/@current-page) - 1) * number(/data/forum-replies/pagination/@entries-per-page) - 1"/>


<xsl:template name="main">
	<h4><xsl:value-of select="/data/forum-current-discussion/entry/topic"/></h4>
    <xsl:call-template name="forum-reply-pagination"/>
    <xsl:apply-templates select="/data/forum-replies/entry"/>
    <xsl:call-template name="forum-reply-pagination"/>
    <xsl:choose>
        <xsl:when test="$member-is-logged-in">
            <xsl:call-template name="forum-reply"/>
        </xsl:when>
        <xsl:otherwise>
            <div class="thread-block">
                <h6>Please <a href="#login-form">log in</a> or <a href="{$root}/register">join the community</a> to participate in discussion.</h6>
            </div>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="forum-reply-pagination">
    <xsl:if test="/data/forum-replies/pagination/@total-pages &gt; 1">
        <nav class="thread-block">
            <div class="pager-holder">
                <xsl:call-template name="pagination">
                    <xsl:with-param name="pagination" select="/data/forum-replies/pagination"/>
                    <xsl:with-param name="pagination-url" select="'?page=$'"/>
                    <xsl:with-param name="show-navigation" select="false"/>
                    <xsl:with-param name="class-pagination" select="'pager'"/>
                    <xsl:with-param name="class-selected" select="'active'"/>
                </xsl:call-template>
            </div>
        </nav>
    </xsl:if>
</xsl:template>

<xsl:template match="/data/forum-replies/entry">
    <xsl:variable name="comment-number" select="$starting-comment-number + position()"/>
    <a name="comment-{$comment-number}"/>
    <div class="thread-block">
        <aside class="message-user-info">
            <p><a href="{$root}/members-profile/{./author/item/@id}" class="user"><xsl:value-of select="./author/item"/></a></p>
            <p><xsl:value-of select="./date-created"/>, <xsl:value-of select="./date-created/@time"/></p>
            <p class="smaller">
                <a class="comment-anchor" href="#comment-{$comment-number}">
                    <xsl:text>comment #</xsl:text>
                    <xsl:value-of select="$comment-number"/>
                </a>
                <xsl:choose>
                    <xsl:when test="$member-is-logged-in and $member-id = ./author/item/@id">
                        <a class="edit" href="{$root}/forum-reply/{$discussion-id}/{@id}">edit</a>
                    </xsl:when>
                </xsl:choose>
            </p>
        </aside>
        <article class="markdown">
            <xsl:copy-of select="message/*"/>
        </article>
    </div>
</xsl:template>

<xsl:template name="side-context">
    <xsl:apply-templates select="/data/forum-categories"/>
    <xsl:call-template name="forum-actions"/>
</xsl:template>

</xsl:stylesheet>