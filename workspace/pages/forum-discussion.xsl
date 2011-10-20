<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/form-reply-form.xsl"/>
<xsl:import href="../utilities/forum-categories.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>
<xsl:import href="../utilities/master.xsl"/>

<xsl:variable name="member-is-logged-in" select="boolean(//events/member-login-info/@logged-in = 'yes')"/>

<xsl:template name="main">
	<h4><xsl:value-of select="/data/forum-current-discussion/entry/topic"/></h4>
    <xsl:call-template name="forum-reply-pagination"/>
    <xsl:apply-templates select="/data/forum-current-discussion/entry"/>
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

    <!--
        pass discussion id or triggering forum-discussion-read event via ajax request
        if entry already exist, no ajax required
    -->
    <script type="text/javascript">
        app.templates.discussion = true;
        <xsl:choose>
            <xsl:when test="/data/forum-discussion-member/entry/discussion/item[@id = $discussion-id]"/>
            <xsl:otherwise>
                app.discussionId = <xsl:value-of select="$discussion-id"/>;
            </xsl:otherwise>
        </xsl:choose>
    </script>
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

<!-- TODO: refactor model, remove duplicate rules [see mind map for detail] -->
<xsl:template match="/data/forum-current-discussion/entry">
    <div class="thread-block">
        <aside class="message-user-info">
            <p><a href="#" class="user"><xsl:value-of select="./author/item"/></a></p>
            <p><xsl:value-of select="./date-created"/>, <xsl:value-of select="./date-created/@time"/></p>
            <xsl:choose>
                <xsl:when test="$member-is-logged-in and $member-id = ./author/item/@id">
                    <p class="controls"><a href="#">edit</a></p>
                </xsl:when>
            </xsl:choose>
        </aside>
        <article class="markdown">
            <xsl:copy-of select="message/*"/>
        </article>
    </div>
</xsl:template>

<xsl:template match="/data/forum-replies/entry">
    <div class="thread-block">
        <aside class="message-user-info">
            <p><a href="#" class="user"><xsl:value-of select="./author/item"/></a></p>
            <p><xsl:value-of select="./date-created"/>, <xsl:value-of select="./date-created/@time"/></p>
            <xsl:choose>
                <xsl:when test="$member-is-logged-in and $member-id = ./author/item/@id">
                    <p class="controls"><a href="{$root}/forum-reply/{$discussion-id}/{@id}">edit</a></p>
                </xsl:when>
            </xsl:choose>
        </aside>
        <article class="markdown">
            <xsl:copy-of select="message/*"/>
        </article>
    </div>
</xsl:template>

<xsl:template name="side-context">
    <xsl:apply-templates select="/data/forum-categories"/>
</xsl:template>

</xsl:stylesheet>