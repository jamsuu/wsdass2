<%@	page language="java"
         import="javax.xml.parsers.*,org.w3c.dom.*,java.io.*,javax.xml.transform.*,javax.xml.transform.stream.*,java.util.*,wsd.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<link rel="stylesheet" href="css/style.css" />
	<title>WSD Assignment 2 - Lookup Tables</title>
</head>
<body>
	<form method="get">
	    <%
	    InputStream xsls = application.getResourceAsStream("/assignment2/designation_dropdown.xsl");
	    XMLTransformer xmlTransformer = new XMLTransformer(xsls, "http://www-student.it.uts.edu.au/~brookes/gns/lookup/designation", out);
		xmlTransformer.transform();

		xsls = application.getResourceAsStream("/assignment2/division_dropdown.xsl");
		xmlTransformer = new XMLTransformer(xsls, "http://www-student.it.uts.edu.au/~brookes/gns/lookup/administrative_division", out);
		xmlTransformer.transform(); 
	  	%>
		<input type="text" name="name" />
		<input type="submit" />
	</form>
    <% if (request.getQueryString() != null) {
    	String designation = request.getParameter("designation") == null ? "" : request.getParameter("designation");
		String division = request.getParameter("administrative_division") == null ? "" : request.getParameter("administrative_division");
		String nametype = request.getParameter("name") == null ? "" : request.getParameter("name"); 
		String page_num = request.getParameter("administrative_division") == null ? "" : request.getParameter("administrative_division");
		String limit = request.getParameter("limit") == null ? "" : request.getParameter("limit");
			
		String query = designation.length() > 0 ? "/designation/" + designation : "";
		query += division.length() > 0 ? "/administrative_division/" + division : "";
		query += nametype.length() > 0 ? "/name/" + nametype : ""; 	 
			
		if (query.length() > 0) {
			xsls = application.getResourceAsStream("/assignment2/features_table.xsl");
			xmlTransformer = new XMLTransformer(xsls, "http://www-student.it.uts.edu.au/~brookes/gns/features" + query, out);
		
			String primary_sort = request.getParameter("sort_by") == null ? "sort_key" : request.getParameter("sort_by"); 			
			xmlTransformer.setParameter("sort_by", primary_sort);
		
			xmlTransformer.transform();
		} else { 
		%>
			<span>There was an error</span>
		<%	
	    }
	} 
	%>
</body>
</html>