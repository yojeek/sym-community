<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:exsl="http://exslt.org/common"
    xmlns:form="http://nick-dunn.co.uk/xslt/form-controls"
    extension-element-prefixes="exsl form">

<xsl:import href="../utilities/exsl/exsl.xsl"/>
<xsl:import href="../utilities/form-controls.xsl"/>

<!-- Define a global variable pointing to your Event -->
<xsl:variable name="form:event" select="/data/events/forum-new-reply"/>

<xsl:template name="forum-reply">
    <xsl:param name="reply-id" select="''"/>

    <div class="thread-block">
        <xsl:call-template name="form:validation-summary"/>
    </div>
    
    <div class="thread-block thread-reply">
        <form method="post" action="" class="normal">
            <xsl:if test="$reply-id != ''">
                <input name="id" type="hidden" value="{$reply-id}" />
                <input name="redirect" type="hidden" value="{$root}/forum-discussion/{$discussion-id}" />
            </xsl:if>
            <xsl:call-template name="form:input">
                <xsl:with-param name="handle" select="'author'"/>
                <xsl:with-param name="type" select="'hidden'"/>
                <xsl:with-param name="value">
                    <xsl:value-of select="$member-id"/>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:call-template name="form:input">
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
                    <xsl:with-param name="handle" select="'message'"/>
                    <xsl:with-param name="rows" select="'5'"/>
                    <xsl:with-param name="cols" select="'40'"/>
                    <xsl:with-param name="class" select="'markdown-editor'"/>
                    <xsl:with-param name="value" select="/data/forum-replies/entry[@id = $reply-id]/message[@mode = 'unformatted']"/>
                </xsl:call-template>
            </div>
        </form>
    </div>
</xsl:template>

</xsl:stylesheet>