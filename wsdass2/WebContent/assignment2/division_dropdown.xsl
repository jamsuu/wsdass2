<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="yes" />
	<xsl:param name="administrative_division" />

	<xsl:template match="/lookup">
		<select name="administrative_division">
			<option value="">Select A Division.. </option>
			<xsl:apply-templates />
		</select>
	</xsl:template>
	
	<xsl:template match="entry">
		<option>
			<xsl:attribute name="value">
				<xsl:apply-templates select="code" />
			</xsl:attribute>
			<xsl:if test="$administrative_division = code">
				<xsl:attribute name="selected">selected</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="name" />
		</option>
	</xsl:template>
	
	<xsl:template match="description" />
</xsl:stylesheet>