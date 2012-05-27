<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="yes" />
	<xsl:key name="groupByUFI" match="feature" use="@ufi" />
	<xsl:param name="page" />
	<xsl:param name="limit" />
	<xsl:param name="sort_by" />
	<xsl:param name="designation" />
	<xsl:param name="administrative_division" />
	<xsl:param name="name" />	
	<xsl:param name="source" />
	<xsl:param name="destination" />
	<!-- form the base of the query string -->
	<xsl:variable name="query">
		?name=<xsl:value-of select="$name" />
		&amp;designation=<xsl:value-of select="$designation" />
		&amp;administrative_division=<xsl:value-of select="$administrative_division" />
	</xsl:variable>

	<xsl:template match="/features">
		<!-- initialise pagination variables -->
		<xsl:variable name="count" select="count(feature)"/>
		<xsl:variable name="selectedRowCount" select="floor(((number($count)-1) div $limit))"/>
		
		<div class="sort_bar">
			<!-- create the sort bar -->
			<span>Sort By: </span>			
			<ul>
				<li>
					<!-- check that the $sort_by parameter is equal to this column so we can style it -->
					<xsl:if test="$sort_by = 'full_name'"><xsl:attribute name="class">selected</xsl:attribute></xsl:if>
					<a>
						<!-- form the remainder of the query string (note we want to reset pagination) -->
						<xsl:attribute name="href">
							<xsl:value-of select="$query" />
							&amp;sort_by=full_name
						</xsl:attribute>
						Name
					</a>
				</li>
				<li>
					<xsl:if test="$sort_by = 'designation'"><xsl:attribute name="class">selected</xsl:attribute></xsl:if>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="$query" />
							&amp;sort_by=designation
						</xsl:attribute>
						Designation
					</a>
				</li>
				<li>
					<xsl:if test="$sort_by = 'administrative_division'"><xsl:attribute name="class">selected</xsl:attribute></xsl:if>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="$query" />
							&amp;sort_by=administrative_division
						</xsl:attribute>
						Division
					</a>
				</li>
				<li>
					<xsl:if test="$sort_by = 'name_type'"><xsl:attribute name="class">selected</xsl:attribute></xsl:if>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="$query" />
							&amp;sort_by=name_type
						</xsl:attribute>
						Name Type
					</a>
				</li>
				<li>
					<xsl:if test="$sort_by = 'modified'"><xsl:attribute name="class">selected</xsl:attribute></xsl:if>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="$query" />
							&amp;sort_by=modified
						</xsl:attribute>
						Modified
					</a>
				</li>
			</ul>
		</div>
		
		<table>
			<thead>
				<tr>
					<th>From</th>
					<th>To</th>
					<th>Name</th>
					<th>Designation</th>
					<th>Division</th>
					<th>Name Type</th>
					<th>Modified</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<!-- use muenchian grouping so we can group all the features with the same ufi -->
				<xsl:for-each select="feature[generate-id() = generate-id(key('groupByUFI', @ufi)[1])]">
				
					<!-- sort by primary and then sort_key -->
					<xsl:sort select="*[name()=$sort_by]" />
					<xsl:sort select="*[name()='sort_key']" />
					
					<!-- grab features that fall between this pages range -->
					<xsl:if test="position() > ($page * $limit) and position() &lt;= $limit + ($page * $limit)">
						<xsl:apply-templates select="current()" />
					</xsl:if>
				</xsl:for-each>
			</tbody>
		</table>
		
		<div class="paginator">
			<!-- Prev link for pagination -->
	      	<xsl:choose>
	       		<xsl:when test="number($page)-1 &gt;= 0">
	        		<a class="prev">
	         			<xsl:attribute name="href">
	         				<xsl:value-of select="$query" />&amp;sort_by=<xsl:value-of select="$sort_by" />&amp;page=<xsl:value-of select="number($page)-1" />&amp;limit=<xsl:value-of select="$limit"/>
						</xsl:attribute>&lt; Prev</a>
	       		</xsl:when>
	      	</xsl:choose>
	      
	      	<xsl:if test="$selectedRowCount &gt; 1">
	      		<span class="count">
	       			<xsl:value-of select="number($page)+1"/>
	       			of
	       			<xsl:value-of select="number($selectedRowCount)"/>
	       		</span>
	      	</xsl:if>
	               
	      	<!-- Next link for pagination -->
	      	<xsl:choose>
	       		<xsl:when test="number($page)+1 &lt; number($selectedRowCount)">
	        		<a class="next">
	         			<xsl:attribute name="href">
	         				<xsl:value-of select="$query" />&amp;sort_by=<xsl:value-of select="$sort_by" />&amp;page=<xsl:value-of select="number($page)+1"/>&amp;limit=<xsl:value-of select="$limit"/>
	         			</xsl:attribute>Next >
	        		</a>
	       		</xsl:when>
	      	</xsl:choose>
      	</div>
	</xsl:template>
	
	<xsl:template match="feature">
		<tr>
			<td>
				<input type="radio" name="source">
					<xsl:attribute name="value">
						<xsl:value-of select="@ufi" />
					</xsl:attribute>
					<xsl:if test="$source = @ufi">
						<xsl:attribute name="checked" />	
					</xsl:if>
				</input>
			</td>
			<td>
				<input type="radio" name="destination">
					<xsl:attribute name="value">
						<xsl:value-of select="@ufi" />
					</xsl:attribute>
					<xsl:if test="$destination = @ufi">
						<xsl:attribute name="checked" />	
					</xsl:if>
				</input>
			</td>
			<xsl:apply-templates select="full_name" />
			<xsl:apply-templates select="designation" />
			<xsl:apply-templates select="administrative_division" />
			<xsl:apply-templates select="name_type" />
			<xsl:apply-templates select="modified" />
			<td>
				<a>
					<xsl:attribute name="href">detail.jsp?designation=<xsl:value-of select="designation" />&amp;administrative_division=<xsl:value-of select="administrative_division" />&amp;ufi=<xsl:value-of select="@ufi" /></xsl:attribute>
					View Map
				</a>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="designation">
		<!-- grab the entries from this external xml so we can get the designation name from the code -->
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
		<td style="max-width: 400px;">
			<a>
				<!-- form the query string to get to googlemaps page -->
				<xsl:attribute name="href">detail.jsp?designation=<xsl:value-of select="../designation" />&amp;administrative_division=<xsl:value-of select="../administrative_division" />&amp;ufi=<xsl:value-of select="../@ufi" /></xsl:attribute>
				<xsl:apply-templates />
				<!-- loop through all the features that have the same ufi as this one -->
				<xsl:for-each select="key('groupByUFI', ../@ufi)">
					
					<!-- we skip the first one because we already displayed the name -->
					<xsl:if test="position() = 2">
					(also known as 	
					</xsl:if>
					
					<!-- we want to display the values as (also know as 'aka') -->
					<xsl:if test="position() > 1">
						'<xsl:value-of select="full_name" />'
						<xsl:if test="position()!=last()">, </xsl:if>
						<xsl:if test="position()=last()">)</xsl:if>
					</xsl:if>
				</xsl:for-each>
			</a>				
		</td>
	</xsl:template>
	
	<xsl:template match="modified">
		<td><xsl:apply-templates /></td>
	</xsl:template>
	
	<xsl:template match="sort_key" />
	<xsl:template match="short_name" />
</xsl:stylesheet>