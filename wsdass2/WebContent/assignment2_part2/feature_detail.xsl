<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="ufi" />
	<xsl:variable name="designation_xml" select="document('http://www-student.it.uts.edu.au/~brookes/gns/lookup/designation')/lookup/entry" />
	<xsl:variable name="division_xml" select="document('http://www-student.it.uts.edu.au/~brookes/gns/lookup/administrative_division')/lookup/entry" />
	<xsl:variable name="nametype_xml" select="document('http://www-student.it.uts.edu.au/~brookes/gns/lookup/nametype')/lookup/entry" />
	
	<xsl:template match="/features">
		<table>
			<thead>
				<th>Designation</th>
				<th>Administrative Division</th>
				<th>Name Type</th>
				<th>Name</th>
				<th>Modified</th>
			</thead>
			<tbody>
				<xsl:apply-templates select="feature[@ufi=$ufi]"/>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="feature">
		<tr>
			<xsl:apply-templates />
		</tr>
	</xsl:template>
	
	<xsl:template match="designation">
	    <td><xsl:value-of select="$designation_xml[code=current()]/name" /></td>
	</xsl:template>
	
	<xsl:template match="administrative_division">
		<td><xsl:value-of select="$division_xml[code=current()]/name" /></td>
	</xsl:template>
	
	<xsl:template match="name_type">
		<td><xsl:value-of select="$nametype_xml[code=current()]/name" /></td>
	</xsl:template>
	
	<xsl:template match="full_name">
		<td><xsl:apply-templates /></td>
	</xsl:template>
	
	<xsl:template match="modified">
		<td><xsl:apply-templates /></td>
	</xsl:template>
	
	<xsl:template match="sort_key"/>
	<xsl:template match="short_name" />
</xsl:stylesheet>