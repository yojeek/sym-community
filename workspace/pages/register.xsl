<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/members.form-register.xsl"/>

<xsl:template name="main">
	<h1><xsl:value-of select="$page-title"/></h1>
    <xsl:choose>
        <xsl:when test="/data/events/member-login-info/@logged-in = 'no'">
            <xsl:call-template name="members-form-register" />
        </xsl:when>
        <xsl:otherwise>
            <h6>You should <a href="?member-action=logout&amp;redirect={$root}/register/">logout</a> first.</h6>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="side-context">
    <div class="side-block">
        <h6>side-context</h6>
        <p>content there</p>
    </div>
</xsl:template>

</xsl:stylesheet>