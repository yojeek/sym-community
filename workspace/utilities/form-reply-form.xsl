<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:exsl="http://exslt.org/common"
    xmlns:form="http://nick-dunn.co.uk/xslt/form-controls"
    extension-element-prefixes="exsl form">

<xsl:import href="../utilities/exsl/exsl.xsl"/>
<xsl:import href="../utilities/form-controls.xsl"/>

<xsl:template name="forum-reply">
    <xsl:param name="reply-id" select="''"/>

    <div class="thread-block">
        <xsl:call-template name="form:validation-summary">
            <xsl:with-param name="event" select="/data/events/forum-new-reply"/>
        </xsl:call-template>
    </div>
    
    <div class="thread-block thread-reply">
        <form method="post" action="" class="normal" id="reply-form">
            <xsl:if test="$reply-id != ''">
                <input name="forum-new-reply[id]" type="hidden" value="{$reply-id}" />
                <input name="redirect" type="hidden" value="{$root}/forum-discussion/{$discussion-id}" />
            </xsl:if>
            <xsl:call-template name="form:input">
                <xsl:with-param name="event" select="/data/events/forum-new-reply"/>
                <xsl:with-param name="section" select="'forum-new-reply'"/>
                <xsl:with-param name="handle" select="'author'"/>
                <xsl:with-param name="type" select="'hidden'"/>
                <xsl:with-param name="value">
                    <xsl:value-of select="$member-id"/>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="form:input">
                <xsl:with-param name="event" select="/data/events/forum-new-reply"/>
                <xsl:with-param name="section" select="'forum-new-reply'"/>
                <xsl:with-param name="handle" select="'discussion'"/>
                <xsl:with-param name="type" select="'hidden'"/>
                <xsl:with-param name="value">
                    <xsl:value-of select="$discussion-id"/>
                </xsl:with-param>
            </xsl:call-template>

            <aside class="message-user-info">
                <h6>Your reply:</h6>
                <input name="action[forum-new-reply]" type="submit" value="Post Reply" class="button"/>
            </aside>
            <div class="markdown">
                <xsl:call-template name="form:textarea">
                    <xsl:with-param name="event" select="/data/events/forum-new-reply"/>
                    <xsl:with-param name="section" select="'forum-new-reply'"/>
                    <xsl:with-param name="handle" select="'message'"/>
                    <xsl:with-param name="rows" select="'5'"/>
                    <xsl:with-param name="cols" select="'40'"/>
                    <xsl:with-param name="class" select="'markdown-editor'"/>
                    <xsl:with-param name="value" select="/data/forum-replies/entry[@id = $reply-id]/message[@mode = 'unformatted']"/>
                </xsl:call-template>
            </div>

            <!--
                complimentary events triggers only if first was succesful
                see event.forum_new_reply.php for details
            -->
            <xsl:variable name="new-number-of-replies">
                <xsl:choose>
                    <xsl:when test="$reply-id != ''">
                        <xsl:value-of select="count(/data/forum-replies/entry) - 1"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="count(/data/forum-replies/entry)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <!-- forum-discussion-member : update entry if exists -->
            <xsl:apply-templates select="/data/forum-discussion-member/entry[discussion/item/@id = $discussion-id]"/>
            <!-- update activity data for discussion -->
            <input name="forum-discussion-involved[number-of-replies]" type="hidden" value="{$new-number-of-replies}"/>
            <input name="forum-discussion-update[number-of-replies]" type="hidden" value="{$new-number-of-replies}"/>
        </form>
    </div>
</xsl:template>

<xsl:template match="/data/forum-discussion-member/entry">
        <input name="forum-discussion-involved[id]" type="hidden" value="{@id}" />
</xsl:template>

</xsl:stylesheet>