<?xml version="1.0" encoding="UTF-8" ?>
<!--
	HTML5 Boilerplate XSLT Master Stylesheet (based on Paul Irish's HTML5 Boilerplate index.html file)
	Created by Brian Zerangue on 2010-11-15.
	Copyright (c) 2010 Paul Irish (Everything but the XSLT), Brian Zerangue (XSLT).
        HTML5 Boilerplate, http://html5boilerplate.com
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="navigation.xsl"/>
<xsl:import href="side-common.xsl"/>
<xsl:import href="xml-to-string.xsl"/>

<xsl:variable name="member-is-logged-in" select="boolean(//events/member-login-info/@logged-in = 'yes')"/>

<xsl:output encoding="UTF-8" 
            indent="yes"
            method="html" 
            media-type="text/html" 
            omit-xml-declaration="yes" />
            
<xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;</xsl:text>!DOCTYPE html<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
    <xsl:comment><![CDATA[[if lt IE 7]><html lang="en" class="no-js ie6"><![endif]]]></xsl:comment>
    <xsl:comment><![CDATA[[if IE 7]><html lang="en" class="no-js ie7"><![endif]]]></xsl:comment>
    <xsl:comment><![CDATA[[if IE 8]><html lang="en" class="no-js ie8"><![endif]]]></xsl:comment>
    <xsl:comment><![CDATA[[if IE 9]><html lang="en" class="no-js ie9"><![endif]]]></xsl:comment>
    <xsl:comment><![CDATA[[if IE]><![if (gt IE 9)|!(IE)]><![endif]]]></xsl:comment><html lang="en" class="no-js">
    <xsl:comment><![CDATA[[if IE]><![endif]><![endif]]]></xsl:comment>
    <head>   
      <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame 
           Remove this if you use the .htaccess -->
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/><!-- This does not validate -->

      <title><xsl:value-of select="$page-title"/></title>
      <meta name="description" content=""/>
      <meta name="author" content=""/>

      <!--  Mobile viewport optimized: j.mp/bplateviewport -->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

      <!-- Place favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
      <link rel="shortcut icon" href="{$workspace}/img/favicon.ico"/>


      <!-- CSS : implied media="all" -->
      <link rel="stylesheet" href="{$workspace}/css/960_12_col.css"/>
      <link rel="stylesheet" href="{$workspace}/css/markitup.css"/>
      <link rel="stylesheet" href="{$workspace}/css/style.css"/>

      <!-- Uncomment if you are specifically targeting less enabled mobile browsers
      <link rel="stylesheet" media="handheld" href="css/handheld.css?v=2">  -->

      <!-- All JavaScript at the bottom, except for Modernizr which enables HTML5 elements & feature detects -->
      <!--<script src="js/libs/modernizr-1.6.min.js"/>-->
        <script type="text/javascript">
            // define namespace
            var app = {};
            // templates will register themselves in this object
            app.templates = {};
            <xsl:if test="data/params/member-id">
                // we also need track user id
                app.memberId = <xsl:value-of select="$member-id"/>
            </xsl:if>
        </script>
    </head>

    <body>
        <div class="container_12">
            <header class="grid_12">
                <div class="grid_3 alpha">
                    <a href="/" tabindex="1"><img src="{$workspace}/img/logo.png" alt="logo" /></a>
                </div>
                <nav id="nav-main" class="grid_5">                         
                    <div class="grid_1 alpha">
                        <h6>Features:</h6>
                    </div>
                    <div class="grid_4 omega">
                        <xsl:call-template name="navigation"/>                                    
                    </div>               
                </nav>
                <aside id="user-info" class="grid_4 omega">
                    <p>
                        <a href="{root}/register">Join the community.</a>
                    </p>
                </aside>
            </header>
            <div class="clearfix"/>
            <div class="grid_3 side">
                <xsl:call-template name="side-context" />
                <xsl:call-template name="side-common" />
            </div>
            <section class="grid_9 main">
                <xsl:call-template name="main"/>               
            </section>                
            <footer class="grid_12">
                <nav id="nav-footer">
                        <ul>
                            <li class="caption">Related links:</li>
                            <li class="first"><a href="#">repo@github</a></li>
                            <li><a href="#">home@symphony-cms.com</a></li>
                        </ul>                                    
                </nav>        
            </footer>

            <!-- debugging stuff -->
            <div class="debug">
            <p>XML tree:</p>
            <pre><code>
                <xsl:call-template name="xml-to-string">
                    <xsl:with-param name="node-set" select="."/>
                </xsl:call-template>
            </code></pre>
            </div>

        </div>      
     
      <!-- JavaScript at the bottom for fast page loading -->

      <!-- Grab Google CDN's jQuery. fall back to local if necessary -->
      <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.js"/>
      <script><![CDATA[!window.jQuery && document.write(unescape('%3Cscript src="/workspace/js/libs/jquery-1.6.2.js"%3E%3C/script%3E'))]]></script>

      <!-- scripts concatenated and minified via ant build script-->
        <script src="{$workspace}/js/script.js"/>
        <script src="{$workspace}/js/jquery.markitup.js"/>
      <!-- end scripts-->


      <xsl:comment><![CDATA[[if lt IE 7]>
        <script src="js/libs/dd_belatedpng.js"></script>
        <script> DD_belatedPNG.fix('img, .png_bg'); //fix any <img> or .png_bg background-images </script>
      <![endif]]]></xsl:comment>

    </body>
</html>
</xsl:template>
</xsl:stylesheet>