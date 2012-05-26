<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="yes" />
	<xsl:param name="designation" />
	
	<xsl:template match="/lookup">
		<select name="designation">
			<option value="">Select A Designation..</option>
			<xsl:apply-templates />
		</select>
	</xsl:template>
	
	<xsl:template match="entry">
		<option>
			<xsl:attribute name="value">
				<xsl:apply-templates select="code" /> 
			</xsl:attribute>
			<xsl:if test="$designation = code">
				<xsl:attribute name="selected">selected</xsl:attribute>
			</xsl:if>
			<xsl:apply-templates select="name" />
		</option>
	</xsl:template>
	
	<xsl:template match="description" />
</xsl:stylesheet>