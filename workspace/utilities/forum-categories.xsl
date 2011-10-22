<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="data/forum-categories">
    <xsl:param name="category-id" select="''"/>
    <nav class="side-block">
        <h6>Categories</h6>
        <ul>
            <xsl:choose>
                <xsl:when test="$category-id = '' and ($current-page = 'forum' or $current-page = 'filter')">
                    <li class='active'><a href="{$root}/forum">All categories</a></li>
                </xsl:when>
                <xsl:otherwise>
                    <li><a href="{$root}/forum">All categories</a></li>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="entry">
                <xsl:with-param name="category-id" select="$category-id"/>
            </xsl:apply-templates>
        </ul>
    </nav>
</xsl:template>

<xsl:template match="data/forum-categories/entry">
    <xsl:param name="category-id" select="''"/>
    <xsl:choose>
        <xsl:when test="$category-id = ./name/@handle">
            <li class='active'><xsl:value-of select="name"/></li>
        </xsl:when>
        <xsl:otherwise>
            <li><a href="{$root}/forum/{name/@handle}"><xsl:value-of select="name"/></a></li>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>