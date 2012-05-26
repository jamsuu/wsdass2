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
	<div class="container">
		<%
    	String designation = request.getParameter("designation") == null ? "" : request.getParameter("designation");
		String division = request.getParameter("administrative_division") == null ? "" : request.getParameter("administrative_division");
		String name = request.getParameter("name") == null ? "" : request.getParameter("name"); 
		String page_num = request.getParameter("page") == null ? "0" : request.getParameter("page");
		String limit = request.getParameter("limit") == null ? "5" : request.getParameter("limit");
		%>
		<form method="get" action="">
			<fieldset>
				<label>Name: </label><input type="text" name="name" value="<%= name %>" />
			    <%
			    InputStream xsls = application.getResourceAsStream("/assignment2/designation_dropdown.xsl");
			    XMLTransformer transformer = new XMLTransformer(xsls, "http://www-student.it.uts.edu.au/~brookes/gns/lookup/designation", out);
				transformer.setParameter("designation", designation);
				transformer.transform();
		
				xsls = application.getResourceAsStream("/assignment2/division_dropdown.xsl");
				transformer = new XMLTransformer(xsls, "http://www-student.it.uts.edu.au/~brookes/gns/lookup/administrative_division", out);
				transformer.setParameter("administrative_division", division);
				transformer.transform(); 
			  	%>
				<input type="submit" value="Search" />
			</fieldset>
		</form>
	    <% if (request.getQueryString() != null) {				
			String query = designation.length() > 0 ? "/designation/" + designation : "";
			query += division.length() > 0 ? "/administrative_division/" + division : "";
			query += name.length() > 0 ? "/name/" + name : ""; 	 
				
			if (query.length() > 0) {
				xsls = application.getResourceAsStream("/assignment2/features_table.xsl");
				transformer = new XMLTransformer(xsls, "http://www-student.it.uts.edu.au/~brookes/gns/features" + query, out);
			
				String primary_sort = request.getParameter("sort_by") == null ? "sort_key" : request.getParameter("sort_by"); 			
				transformer.setParameter("sort_by", primary_sort);
				transformer.setParameter("administrative_division", division);
				transformer.setParameter("designation", designation);
				transformer.setParameter("name", name);
				transformer.setParameter("page", page_num);
				transformer.setParameter("limit", limit);
				
				transformer.transform();
			} else { 
			%>
				<p style="text-align: center; font-size: 1.1em; border: 1px solid #FB6A6A; border-radius: 5px; background: #FDD5D5; padding: 5px; color: red;">
					Please provide a name, designation or administrative division to search!
				</p>
			<%	
		    }
		} 
		%>
	</div>
</body>
</html>