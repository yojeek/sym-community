<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="forum-actions">
    <xsl:choose>
        <xsl:when test="$member-is-logged-in">
            <nav class="side-block">
                <h6>Actions</h6>
                <ul>
                    <li><a href="{$root}/forum-new-discussion">Start a new discussion</a></li>
                </ul>
            </nav>
        </xsl:when>
    </xsl:choose>
</xsl:template>    

</xsl:stylesheet>