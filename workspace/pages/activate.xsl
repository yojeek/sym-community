<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/members.form-activate-account.xsl"/>
<xsl:import href="../utilities/members.form-regenerate-activation-code.xsl"/>

<xsl:template name="main">
	<h1><xsl:value-of select="$page-title"/></h1>

    <xsl:call-template name="members-form-activate-account"/>

    <p class="m-12">You can generate new code in case of problems with activation.</p>

    <xsl:call-template name="members-form-regenerate-activation-code"/>
</xsl:template>

<xsl:template name="side-context">
    <div class="side-block">
        <h6>side-context</h6>
        <p>content there</p>
    </div>
</xsl:template>

</xsl:stylesheet>