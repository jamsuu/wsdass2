<?xml version="1.0" encoding="UTF-8"?>

<element>xsl:stylesheet</element> version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<HTML> 
<Head>
<TITLE>Lookup Tables</TITLE>
</Head>
<BODY bgcolor='FFBF00'>
<H1>Lookup Tables</H1>
<FORM METHOD="POST" ACTION="webpage.jsp">
<P><i> Administrative Division </i>
<SELECT NAME="name">
<xsl:template match="name" >
<xsl:apply-templates/>
</xsl:template>

</SELECT>
<INPUT TYPE="SUBMIT" VALUE="Display Table"></INPUT>
</P>
<FORM METHOD="POST" ACTION="webpage.jsp">
<P><i> Designation </i>
<SELECT NAME="name2">
<xsl:template match="/entry/name" >
<xsl:apply-templates/>
</xsl:template>
</SELECT>
<INPUT TYPE="SUBMIT" VALUE="Display Table"></INPUT>
</P>
</FORM>
</FORM> 
<FORM METHOD="POST" ACTION="webpage.jsp">
<P><i> Name </i>
<input type="text" name="firstname" />
<input type="submit" value="Submit" />
</P>
</FORM>
</BODY>
</HTML>
</xsl:template>

<xsl:template match="name">
<OPTION>
  	<xsl:apply-templates/>
 </OPTION>
</xsl:template>

</xsl:stylesheet>