<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exsl="http://exslt.org/common"
	xmlns:members="http://michael-eichelsdoerfer.de/xslt/members"
	extension-element-prefixes="exsl members">

<xsl:import href="members-forms/members.forms.xsl"/>

<xsl:template name="members-form-login">

	<xsl:variable name="event" select="'member-login-info'"/>

	<xsl:call-template name="members:validate">
		<xsl:with-param name="event" select="$event"/>
	</xsl:call-template>

	<form action="" method="post" class="compact m-4" id="login">

<!--        <div class="form-element left">
            <input id="login-email" type="text" name="fields[email]"/>
        </div>
        <div class="form-element right">
            <input id="login-submit" type="submit" value="" class="button" name="member-action[login]"/>
        </div>
        <div class="form-element left">
            <input id="login-password" type="password" name="fields[password]"/>
        </div>
        <div class="form-element right">
            <div id="login-forgot" class="button" />
        </div>-->

        <!-- our custom login form is little bit too custom -->
        
        <xsl:call-template name="members:input-identity">
			<xsl:with-param name="event" select="$event"/>
            <xsl:with-param name="form-element-class" select="'left'"/>
		</xsl:call-template>
        <div class="form-element right">
            <input id="login-submit" type="submit" value="" class="button" name="member-action[login]" tabindex="100"/>
        </div>
		<xsl:call-template name="members:input-password">
			<xsl:with-param name="event" select="$event"/>
			<xsl:with-param name="mode" select="'login'"/>
            <xsl:with-param name="form-element-class" select="'left'"/>
		</xsl:call-template>
        <div class="form-element right">
            <div id="login-forgot" class="button" />
        </div>
    </form>
    <div class="clearfix"/>

</xsl:template>

</xsl:stylesheet>
