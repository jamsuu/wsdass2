<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- omit to the xml processing instruction being printed as it invalidates the HTML -->
	<xsl:output omit-xml-declaration="yes" />
	<!-- set the param so we can auto select the division previously selected -->
	<xsl:param name="administrative_division" />

	<xsl:template match="/lookup">
		<select name="administrative_division">
			<!-- set the initial select option -->
			<option value="">Select A Division.. </option>
			<xsl:apply-templates />
		</select>
	</xsl:template>
	
	<xsl:template match="entry">
		<option>
			<xsl:attribute name="value">
				<xsl:apply-templates select="code" />
			</xsl:attribute>
			<!-- if there is already a search, maintain the state -->
			<xsl:if test="$administrative_division = code">
				<xsl:attribute name="selected">selected</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="name" />
		</option>
	</xsl:template>
	
	<xsl:template match="description" />
</xsl:stylesheet>