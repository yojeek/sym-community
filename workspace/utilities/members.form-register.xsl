<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:exsl="http://exslt.org/common"
                xmlns:members="http://michael-eichelsdoerfer.de/xslt/members"
                extension-element-prefixes="exsl members" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="http://exslt.org/common
http://michael-eichelsdoerfer.de/xslt/members ">

    <xsl:import href="members-forms/members.forms.xsl"/>

    <xsl:template name="members-form-register">

        <xsl:variable name="event" select="'members-new'"/>

        <xsl:variable name="validation">
            <xsl:call-template name="members:validate">
                <xsl:with-param name="event" select="$event"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="$validation != ''">
                <xsl:copy-of select="$validation" />
            </xsl:when>
            <xsl:otherwise>
                <p class="m-12">Please fill in registration form. Requred fields are starred.</p>
            </xsl:otherwise>
        </xsl:choose>

        <form action="" method="post" id="register" class="normal">
            <xsl:call-template name="members:input">
                <xsl:with-param name="field" select="'username'"/>
                <xsl:with-param name="event" select="$event"/>
                <xsl:with-param name="form-element-class" select="'left required'"/>
            </xsl:call-template>
            <div class="form-element right hint">
                <p>You can use your real name or moniker.</p>
            </div>
            <xsl:call-template name="members:input">
                <xsl:with-param name="field" select="'email'"/>
                <xsl:with-param name="event" select="$event"/>
                <xsl:with-param name="form-element-class" select="'left required'"/>
            </xsl:call-template>
            <div class="form-element right hint">
                <p>Will not be published.</p>
            </div>
            <xsl:call-template name="members:input-password">
                <xsl:with-param name="event" select="$event"/>
                <xsl:with-param name="mode" select="'new'"/>
                <xsl:with-param name="form-element-class" select="'left required'"/>
            </xsl:call-template>
            <xsl:call-template name="members:input-password-confirm">
                <xsl:with-param name="event" select="$event"/>
                <xsl:with-param name="mode" select="'new'"/>
                <xsl:with-param name="form-element-class" select="'right required'"/>
            </xsl:call-template>
            <xsl:call-template name="members:input">
                <xsl:with-param name="field" select="'location'"/>
                <xsl:with-param name="event" select="$event"/>
                <xsl:with-param name="form-element-class" select="'left'"/>
            </xsl:call-template>
            <div class="form-element right hint">
                <p>Where are you from?</p>
            </div>
            <xsl:call-template name="members:textarea">
                <xsl:with-param name="field" select="'bio'"/>
                <xsl:with-param name="event" select="$event"/>
                <xsl:with-param name="form-element-class" select="'left markdown-editor-holder'"/>
            </xsl:call-template>
            <div class="form-element right hint">
                <p>Tell other members some words about you.</p>
            </div>
            <div class="clearfix m-8" />
            <xsl:call-template name="members:input-submit">
                <xsl:with-param name="event" select="$event"/>
                <xsl:with-param name="id" select="'register-submit'"/>
                <xsl:with-param name="class" select="'button'"/>
            </xsl:call-template>
        </form>

    </xsl:template>

</xsl:stylesheet>
