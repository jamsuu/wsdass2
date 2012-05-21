<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/location">
		<iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0">
			<xsl:attribute name="src">
				http://maps.google.com/maps?q=<xsl:value-of select="latitude" />,<xsl:value-of select="longitude" />&amp;ie=UTF8&amp;t=m&amp;z=14&amp;output=embed
			</xsl:attribute>
		</iframe><br />
		<small>
			<a style="color:#0000FF;text-align:left">
				<xsl:attribute name="href">
					http://maps.google.com/maps?q=<xsl:value-of select="latitude" />,<xsl:value-of select="longitude" />&amp;ie=UTF8&amp;t=m&amp;z=14&amp;source=embed
				</xsl:attribute>View Larger Map</a>
		</small>
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="entry">
		<option>
			<xsl:attribute name="value">
				<xsl:apply-templates select="code" />
			</xsl:attribute>
			<xsl:apply-templates select="name" />
		</option>
	</xsl:template>
	
	<xsl:template match="description" />
</xsl:stylesheet>