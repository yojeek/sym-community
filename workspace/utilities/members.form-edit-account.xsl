<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exsl="http://exslt.org/common"
	xmlns:members="http://michael-eichelsdoerfer.de/xslt/members"
	extension-element-prefixes="exsl members">

<xsl:import href="members-forms/members.forms.xsl"/>

<xsl:template name="members-form-edit-account">
	
	<xsl:variable name="event" select="'members-edit'"/>

    <xsl:choose>
        <xsl:when test="/data/params/url-password-changed">
            <h6 class="red m-12">Your password was successfully changed.</h6>
        </xsl:when>
        <xsl:otherwise>
            <p class="m-12">If you want to change your password, go <a href="{$root}/members-change-password/">there</a>.</p>
        </xsl:otherwise>
    </xsl:choose>

	<xsl:call-template name="members:validate">
		<xsl:with-param name="event" select="$event"/>
	</xsl:call-template>

	<form action="" method="post" class="normal">
		<input type="hidden" name="id" value="{//events/member-login-info/@id}"/>
		<xsl:call-template name="members:input">
			<xsl:with-param name="field" select="'username'"/>
			<xsl:with-param name="event" select="$event"/>
			<xsl:with-param name="value" select="/data/*[name()=$members:config/data/datasources/member/@handle]/entry/*[name()=$members:config/data/fields/*[@type='username']/@handle]"/>
		</xsl:call-template>
        <xsl:call-template name="members:input">
            <xsl:with-param name="field" select="'location'"/>
            <xsl:with-param name="event" select="$event"/>
            <xsl:with-param name="form-element-class" select="'left'"/>
        </xsl:call-template>
        <xsl:call-template name="members:textarea">
            <xsl:with-param name="field" select="'bio'"/>
            <xsl:with-param name="event" select="$event"/>
            <xsl:with-param name="form-element-class" select="'markdown-editor-holder'"/>
        </xsl:call-template>
        <div class="clearfix m-8" />
		<xsl:call-template name="members:input-submit">
			<xsl:with-param name="event" select="$event"/>
            <xsl:with-param name="class" select="'button'"/>
		</xsl:call-template>
	</form>

</xsl:template>

</xsl:stylesheet>
