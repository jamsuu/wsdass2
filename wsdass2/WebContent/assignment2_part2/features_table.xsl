<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:key name="groupByUFI" match="feature" use="@ufi" />
	<xsl:param name="page" />
	<xsl:param name="limit" />
	<xsl:param name="sort_by" />
	<xsl:param name="designation" />
	<xsl:param name="division" />
	<xsl:param name="nametype" />
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
				<th></th>
			</thead>
			<tbody>
				<xsl:apply-templates select="feature">
					<xsl:sort select="*[name()=$sort_by]" />
					<xsl:sort select="*[name()='sort_key']" />
				</xsl:apply-templates>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="feature">
		<!-- <xsl:if test="position() > 2 and position() &lt; 5">--> 
		<tr>
			<xsl:for-each select="/features/feature[count(. | key('groupByUFI', @ufi)[1]) = 1]">
				<xsl:value-of select="@ufi" />asd
			</xsl:for-each>
			<xsl:apply-templates />
			<xsl:for-each select="feature[generate-id() = generate-id(key('groupByUFI', @ufi)[1])]">
				<xsl:value-of select="@ufi" />asd
			</xsl:for-each>
			<td><xsl:value-of select="@ufi" />
				<a>
					<xsl:attribute name="href">detail.jsp?designation=<xsl:value-of select="$designation" />&amp;administrative_division=<xsl:value-of select="$division" />&amp;name=<xsl:value-of select="$nametype" />&amp;ufi=<xsl:value-of select="current()/@ufi" /></xsl:attribute>
					View More
				</a>
			</td>
		</tr>
		<!-- </xsl:if>-->
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
	
	<xsl:template match="sort_key" />
	<xsl:template match="short_name" />
</xsl:stylesheet>