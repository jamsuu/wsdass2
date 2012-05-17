<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/lookup">
		<select name="administrative_division">
			<xsl:apply-templates />
		</select>
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