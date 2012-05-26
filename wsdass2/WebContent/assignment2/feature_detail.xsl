<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="yes" />
	<xsl:param name="ufi" />
	<xsl:variable name="designation_xml" select="document('http://www-student.it.uts.edu.au/~brookes/gns/lookup/designation')/lookup/entry" />
	<xsl:variable name="division_xml" select="document('http://www-student.it.uts.edu.au/~brookes/gns/lookup/administrative_division')/lookup/entry" />
	<xsl:variable name="nametype_xml" select="document('http://www-student.it.uts.edu.au/~brookes/gns/lookup/nametype')/lookup/entry" />
	
	<xsl:template match="/features">
		<xsl:apply-templates select="feature[@ufi=$ufi and name_type='N']"/>
		<xsl:apply-templates select="feature[@ufi=$ufi and name_type!='N']"/>
	</xsl:template>
	
	<xsl:template match="feature[name_type='N']">
		<div class="content-left">
			<h2><xsl:apply-templates select="full_name" /></h2>
			<p><strong class="italic">UFI: </strong><xsl:value-of select="@ufi" /></p>
			<xsl:apply-templates select="short_name" />
			<xsl:apply-templates select="sort_key" />
			<xsl:apply-templates select="modified" />
			<xsl:apply-templates select="name_type" />
		</div>
		
		<xsl:apply-templates select="designation" />
		<xsl:apply-templates select="administrative_division" />
	</xsl:template>
	
	<xsl:template match="feature[name_type!='N']">
		<div class="content-left">
			<h3>Also Known As <xsl:apply-templates select="full_name" /></h3>
			<p><strong class="italic">UFI: </strong><xsl:value-of select="@ufi" /></p>
			<xsl:apply-templates select="short_name" />
			<xsl:apply-templates select="sort_key" />
			<xsl:apply-templates select="modified" />
			<xsl:apply-templates select="name_type" />
		</div>
	</xsl:template>
	
	<xsl:template match="name_type">
		<!-- grab the entries from this external xml so we can get the designation name from the code -->
		<xsl:variable name="nametype_xml" select="document('http://www-student.it.uts.edu.au/~brookes/gns/lookup/nametype')/lookup/entry" />
		<p><strong>Name Type: </strong>
			<xsl:value-of select="$nametype_xml[code=current()]/code" />
			(<xsl:value-of select="$nametype_xml[code=current()]/name" />) -
			<xsl:value-of select="$nametype_xml[code=current()]/description" />	
		</p>
		
	</xsl:template>
		
	<xsl:template match="designation">
		<div class="content-right designation">
			<xsl:variable name="designation_xml" select="document('http://www-student.it.uts.edu.au/~brookes/gns/lookup/designation')/lookup/entry" />
			<h3>Designation</h3>
			<p><span>Code: </span><xsl:value-of select="$designation_xml[code=current()]/code" /></p>
	    	<p><span>Name: </span><xsl:value-of select="$designation_xml[code=current()]/name" /></p>
	    	<p><span>Description: </span><xsl:value-of select="$designation_xml[code=current()]/description" /></p>
	    </div>
	</xsl:template>
	
	<xsl:template match="administrative_division">
		<div class="content-right division">
			<xsl:variable name="division_xml" select="document('http://www-student.it.uts.edu.au/~brookes/gns/lookup/administrative_division')/lookup/entry" />
			<h3>Administrative Division</h3>
			<p><span>Code: </span><xsl:value-of select="$division_xml[code=current()]/code" /></p>
			<p><span>Name: </span><xsl:value-of select="$division_xml[code=current()]/name" /></p>
			<p><span>Description: </span><xsl:value-of select="$division_xml[code=current()]/description" /></p>
		</div>
	</xsl:template>
	
	<xsl:template match="feature[name_type='N']/full_name">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="modified">
		<p><strong>Modified: </strong><xsl:apply-templates /></p>
	</xsl:template>
	
	<xsl:template match="sort_key">
		<p><strong>Sort Key: </strong><xsl:apply-templates /></p>
	</xsl:template>
	
	<xsl:template match="short_name">
		<p><strong>Short Name: </strong><xsl:apply-templates /></p>
	</xsl:template>
</xsl:stylesheet>