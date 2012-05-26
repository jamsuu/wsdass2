<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="yes" />
	<xsl:template match="/location">
		<div class="content-left">
			<iframe width="600" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0">
				<xsl:attribute name="src">http://maps.google.com/maps?q=<xsl:value-of select="latitude" />,<xsl:value-of select="longitude" />&amp;ie=UTF8&amp;t=m&amp;z=14&amp;output=embed</xsl:attribute>
				Google Maps
			</iframe><br />
			<small>
				<a style="color:#0000FF;text-align:left">
					<xsl:attribute name="href">http://maps.google.com/maps?q=<xsl:value-of select="latitude" />,<xsl:value-of select="longitude" />&amp;ie=UTF8&amp;t=m&amp;z=14&amp;source=embed</xsl:attribute>View Larger Map</a>
			</small>
		</div>
		<div class="content-right">
			<h3>Location Information</h3>
			<p><strong>Latitude: </strong><xsl:value-of select="latitude" /></p>
			<p><strong>Longitude: </strong><xsl:value-of select="longitude" /></p>
		</div>
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="latitude" />
	<xsl:template match="longitude" />
</xsl:stylesheet>