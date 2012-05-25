<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:key name="groupByUFI" match="feature" use="@ufi" />
	<xsl:param name="page">0</xsl:param>
	<xsl:param name="limit">25</xsl:param>
	<xsl:param name="sort_by" />
		
	<xsl:template match="/features">
		<table>
			<thead>
				<th>Designation</th>
				<th>Administrative Division</th>
				<th>Name Type</th>
				<th>Name</th>
				<th>Modified</th>
				<th></th>
			</thead>
			<tbody>
				<xsl:for-each select="feature[generate-id() = generate-id(key('groupByUFI', @ufi)[1])]">
					<xsl:sort select="*[name()=$sort_by]" />
					<xsl:sort select="*[name()='sort_key']" />
					<xsl:if test="position() >= $page and position() &lt;= $limit">
						<xsl:apply-templates select="current()" />
					</xsl:if>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="feature">
		<tr>
			<xsl:apply-templates />
			<td>
				<a>
					<xsl:attribute name="href">detail.jsp?designation=<xsl:value-of select="designation" />&amp;administrative_division=<xsl:value-of select="administrative_division" />&amp;ufi=<xsl:value-of select="current()/@ufi" /></xsl:attribute>
					View Details
				</a>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="designation">
		<xsl:variable name="designation_xml" select="document('http://www-student.it.uts.edu.au/~brookes/gns/lookup/designation')/lookup/entry" />
	    <td><xsl:value-of select="$designation_xml[code=current()]/name" /></td>
	</xsl:template>
	
	<xsl:template match="administrative_division">
		<xsl:variable name="division_xml" select="document('http://www-student.it.uts.edu.au/~brookes/gns/lookup/administrative_division')/lookup/entry" />
		<td><xsl:value-of select="$division_xml[code=current()]/name" /></td>
	</xsl:template>
	
	<xsl:template match="name_type">
		<xsl:variable name="nametype_xml" select="document('http://www-student.it.uts.edu.au/~brookes/gns/lookup/nametype')/lookup/entry" />
		<td><xsl:value-of select="$nametype_xml[code=current()]/name" /></td>
	</xsl:template>
	
	<xsl:template match="full_name">
		<td>
			<xsl:apply-templates />
			<xsl:for-each select="key('groupByUFI', ../@ufi)">
				<xsl:if test="position() = 2">
				(also known as 	
				</xsl:if>
				<xsl:if test="position() > 1">
					'<xsl:value-of select="full_name" />'
					<xsl:if test="position()!=last()">, </xsl:if>
					<xsl:if test="position()=last()">)</xsl:if>
				</xsl:if>
			</xsl:for-each>
		</td>
	</xsl:template>
	
	<xsl:template match="modified">
		<td><xsl:apply-templates /></td>
	</xsl:template>
	
	<xsl:template match="sort_key" />
	<xsl:template match="short_name" />
</xsl:stylesheet>