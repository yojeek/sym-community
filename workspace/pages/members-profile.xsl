<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/members.form-edit-account.xsl"/>

<xsl:template name="main">
	<h1><xsl:value-of select="$page-title"/></h1>
    <xsl:choose>
        <xsl:when test="$profile-member-id = ''">
            <xsl:call-template name="profile-edit"/>
        </xsl:when>
        <xsl:otherwise>
             <xsl:call-template name="profile-view"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="profile-view">
    <div class="markdown">
        <h6>
            <xsl:value-of select="/data/member-profile/entry/username"/>
            <xsl:if test="/data/params/member-id and $profile-member-id = /data/params/member-id">
                <xsl:text>&#160;&#160;</xsl:text>
                <a class='inline' href='{$root}/members-profile/'>edit profile.</a>
            </xsl:if>
        </h6>
        <p class='label'>Location :</p>
        <xsl:choose>
            <xsl:when test="/data/member-profile/entry/location != ''">
                <p><xsl:value-of select="/data/member-profile/entry/location"/></p>
            </xsl:when>
            <xsl:otherwise>
                <p>Not specified.</p>
            </xsl:otherwise>
        </xsl:choose>
        <div class="m-12"/>
        <p class='label'>Bio :</p>
        <xsl:choose>
            <xsl:when test="/data/member-profile/entry/bio != ''">
                <p><xsl:value-of select="/data/member-profile/entry/bio"/></p>
            </xsl:when>
            <xsl:otherwise>
                <p>No info.</p>
            </xsl:otherwise>
        </xsl:choose>
    </div>
</xsl:template>

<xsl:template name="profile-edit">
    <xsl:choose>
        <xsl:when test="/data/params/url-password-changed">
            <h6 class="red m-12">Password was successfully changed.</h6>
            <h6>Please log in again with your new password.</h6>
        </xsl:when>
        <xsl:when test="/data/events/member-login-info/@logged-in='yes'">
            <xsl:call-template name="members-form-edit-account" />
        </xsl:when>
        <xsl:otherwise>
            <h6>You are not logged in.</h6>
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