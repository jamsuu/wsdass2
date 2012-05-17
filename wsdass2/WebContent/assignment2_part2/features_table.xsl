<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="sort_by" />
	
	<xsl:template match="/features">
		<table>
			<thead>
				<th>Designation</th>
			</thead>
			<tbody>
				<xsl:apply-templates select="feature">
					<xsl:sort>
						<xsl:attribute name="select">
							<xsl:value-of select="$sort_by" />
						</xsl:attribute>
					</xsl:sort>
				</xsl:apply-templates>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="feature">
		<tr>
			<xsl:apply-templates />
		</tr>
	</xsl:template>
	
	<xsl:template match="designation">
		<td><xsl:apply-templates /></td>
	</xsl:template>
	
	<xsl:template match="administrative_division">
		<td><xsl:apply-templates /></td>
	</xsl:template>
	
	<xsl:template match="name_type">
		<td><xsl:apply-templates /></td>
	</xsl:template>
	
	<xsl:template match="full_name">
		<td><xsl:apply-templates /></td>
	</xsl:template>
	
	<xsl:template match="modified">
		<td><xsl:apply-templates /></td>
	</xsl:template>
	
	<xsl:template match="sort_key" />
</xsl:stylesheet>