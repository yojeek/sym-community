<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/members.form-login.xsl"/>

<xsl:template name="side-common">
    <aside class="side-block login-form">
        <a name="login-form"/>
        <h6>User area</h6>
        <div class="clearfix"/>
        <xsl:choose>
            <xsl:when test="/data/member-current/entry">
                <p>You are logged in as <strong><xsl:value-of select="/data/member-current/entry/username"/></strong>.</p>
                <p><a href="{$root}/members-profile/{$member-id}">View profile</a> or <a href="?member-action=logout&amp;redirect={$root}">logout</a>.</p>
            </xsl:when>
            <xsl:when test="/data/params/member-id">
                <p>You are logged in.</p>
                <p><a href="{$root}/members-profile/{$member-id}">View profile</a> or <a href="?member-action=logout&amp;redirect={$root}">logout</a>.</p>
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