<?xml version="1.0"?>
<!--
 Epian RSS Reader version 2.0
 Copyright (C) 2006,2009 epian <epian0@yahoo.com>
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="UTF-8" indent="no"/>
  <xsl:param name="showtitle" select="true()"/>
  <xsl:param name="indent" select="'  '"/>

	<xsl:template match="/">
		<!-- RSS 1.0 -->
		<xsl:apply-templates select="rdf:RDF" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"/>

		<!-- RSS 2.0 -->
		<xsl:apply-templates select="rss"/>

    <!-- Atom -->
    <xsl:apply-templates select="atom:feed" xmlns:atom="http://www.w3.org/2005/Atom"/>
	</xsl:template>

	<!-- RSS 1.0 -->
	<xsl:template match="rdf:RDF" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rss1.0="http://purl.org/rss/1.0/" xmlns:dc="http://purl.org/dc/elements/1.1/">
    <xsl:if test="$showtitle">
  	  <xsl:value-of select="rss1.0:channel/rss1.0:title"/><xsl:text>&#xA;</xsl:text>
    </xsl:if>
		<xsl:for-each select="rss1.0:item">
      <xsl:value-of select="$indent"/>
      <xsl:value-of select="rss1.0:title"/>
      <xsl:text>&#xA;</xsl:text>
		</xsl:for-each>
	</xsl:template>

	<!-- RSS 2.0 -->
	<xsl:template match="rss">
    <xsl:if test="$showtitle">
      <xsl:value-of select="channel/title"/><xsl:text>&#xA;</xsl:text>
    </xsl:if>
		<xsl:for-each select="channel/item">
      <xsl:value-of select="$indent"/>
      <xsl:value-of select="title"/>
      <xsl:text>&#xA;</xsl:text>
		</xsl:for-each>
	</xsl:template>

  <!-- Atom -->
  <xsl:template match="atom:feed" xmlns:atom="http://www.w3.org/2005/Atom">
    <xsl:if test="$showtitle">
      <xsl:value-of select="atom:title"/><xsl:text>&#xA;</xsl:text>
    </xsl:if>
    <xsl:for-each select="atom:entry">
      <xsl:value-of select="$indent"/>
      <xsl:value-of select="atom:title"/>
      <xsl:text>&#xA;</xsl:text>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
