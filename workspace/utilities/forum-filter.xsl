<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="forum-filter">
    <nav class="side-block">
        <h6>Filter</h6>
        
        <!--
            seems that i fell in some trap with url parameters
            TODO find more elegant solution for url rewrite patterns
        -->
        <xsl:variable name="path-pattern">
            <xsl:choose>
                <xsl:when test="$current-page = 'filter' or ($current-page = 'forum' and $forum-category = '')">
                    <xsl:value-of select="concat($root,'/forum/filter')"/>
                </xsl:when>
                <xsl:when test="$forum-category != ''">
                    <xsl:value-of select="concat($root,'/forum/',$forum-category)"/>
                </xsl:when>
            </xsl:choose>
        </xsl:variable>
        <ul>
            <xsl:choose>
                <xsl:when test="$forum-filter = 'read'">
                    <li class='active'>Read</li>
                </xsl:when>
                <xsl:otherwise>
                    <li><a href="{$path-pattern}/read/">Read</a></li>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
                <xsl:when test="$forum-filter = 'involved'">
                    <li class='active'>Involved</li>
                </xsl:when>
                <xsl:otherwise>
                    <li><a href="{$path-pattern}/involved/">Involved</a></li>
                </xsl:otherwise>
            </xsl:choose>
        </ul>
    </nav>
</xsl:template>

</xsl:stylesheet>