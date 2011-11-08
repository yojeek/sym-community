<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />


<xsl:template match="/">
    <xsl:variable name="and"><![CDATA[&]]></xsl:variable>

    Hello hello, <xsl:value-of select="/data/member-just-created/entry/username" />.

    Follow this link to activate your membership:

    <xsl:value-of select="$root"/>
    <xsl:text>/activate?code=</xsl:text>
    <xsl:value-of select="concat(/data/member-just-created/entry/activation/code, '&amp;', 'id=',  /data/member-just-created/entry/email) " disable-output-escaping="yes"/>

    Thank you!
</xsl:template>
</xsl:stylesheet>