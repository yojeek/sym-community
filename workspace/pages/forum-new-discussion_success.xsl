<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
<xsl:import href="../utilities/master.xsl"/>

<xsl:template name="main">
	<h1><xsl:value-of select="$page-title"/></h1>
</xsl:template>


<xsl:template name="side-context">
    <div class="side-block">
        <h6>side-context</h6>
        <p>content there</p>
    </div>	
</xsl:template>

</xsl:stylesheet>