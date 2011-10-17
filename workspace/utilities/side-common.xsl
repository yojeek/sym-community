<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/members.form-login.xsl"/>

<xsl:template name="side-common">
    <aside class="side-block login-form">
        <a name="login-form"/>
        <h6>User area</h6>
        <div class="clearfix"/>
        <xsl:choose>
            <xsl:when test="$member-is-logged-in">
                <p>You are logged in. (<a href="?member-action=logout&amp;redirect={$current-url}">Logout</a>)</p>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="members-form-login"/>
                <p class="m-12">Please log in or <a href="{$root}/register">join the community.</a></p>
                <script type="text/javascript">
                    app.templates.formLogin = true;
                </script>
            </xsl:otherwise>
        </xsl:choose>
    </aside>
</xsl:template>

</xsl:stylesheet>