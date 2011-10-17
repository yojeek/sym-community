<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:exsl="http://exslt.org/common"
    xmlns:form="http://nick-dunn.co.uk/xslt/form-controls"
    extension-element-prefixes="exsl form">

<xsl:import href="../utilities/exsl/exsl.xsl"/>
<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/forum-categories.xsl"/>
<xsl:import href="../utilities/form-controls.xsl"/>

<!-- Define a global variable pointing to your Event -->
<xsl:variable name="form:event" select="/data/events/forum-new-discussion"/>

<xsl:template name="main">
	<h1><xsl:value-of select="$page-title"/></h1>
    
    <xsl:call-template name="form:validation-summary"/>

    <form method="post" action="" enctype="multipart/form-data" class="normal">
        <div class="form-element hidden">
            <xsl:call-template name="form:input">
                <xsl:with-param name="handle" select="'author'"/>
                <xsl:with-param name="type" select="'hidden'"/>
                <xsl:with-param name="value">
                    <xsl:value-of select="$member-id"/>
                </xsl:with-param>
            </xsl:call-template>
        </div>
        <div class="form-element left required">
            <label>Category</label>
            <xsl:call-template name="form:select">
                <xsl:with-param name="handle" select="'category'"/>
                <xsl:with-param name="options">
                    <xsl:for-each select="/data/forum-categories/entry">
                        <option value="{@id}"><xsl:value-of select="name"/></option>
                    </xsl:for-each>
                </xsl:with-param>
            </xsl:call-template>
        </div>
        <div class="form-element left required">
            <label>Topic</label>
            <xsl:call-template name="form:input">
                <xsl:with-param name="handle" select="'topic'"/>
            </xsl:call-template>
        </div>
        <div class="form-element full required markdown-editor-holder">
            <label>Message</label>
            <xsl:call-template name="form:textarea">
                <xsl:with-param name="handle" select="'message'"/>
                <xsl:with-param name="rows" select="'5'"/>
                <xsl:with-param name="cols" select="'40'"/>
            </xsl:call-template>
        </div>

        <input name="action[forum-new-discussion]" type="submit" value="Submit" class='button'/>
    </form>
</xsl:template>

<xsl:template name="side-context">
    <xsl:apply-templates select="data/forum-categories"/>
</xsl:template>

</xsl:stylesheet>