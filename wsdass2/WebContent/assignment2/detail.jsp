<%@ page language="java" contentType="text/html"
         import="javax.xml.parsers.*,org.w3c.dom.*,java.io.*,javax.xml.transform.*,javax.xml.transform.stream.*,java.util.*,wsd.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<link rel="stylesheet" href="css/style.css" />
	<title>Assignment 2 - Detail</title>
</head>
<body>
	<% try { %>
	    <% if (request.getQueryString() != null) {
	    	String designation = request.getParameter("designation") == null ? "" : request.getParameter("designation");
			String division = request.getParameter("administrative_division") == null ? "" : request.getParameter("administrative_division");
			String name = request.getParameter("name") == null ? "" : request.getParameter("name"); 
			String ufi = request.getParameter("ufi");
			
			String query = designation.length() > 0 ? "/designation/" + designation : "";
			query += division.length() > 0 ? "/administrative_division/" + division : "";
			query += name.length() > 0 ? "/name/" + name : "";
			
			XMLTransformer transformer = new XMLTransformer(application.getResourceAsStream("/assignment2/feature_detail.xsl"), 
					"http://www-student.it.uts.edu.au/~brookes/gns/features" + query, out);
			transformer.setParameter("ufi", ufi);
		  	transformer.transform();
		  	
		  	transformer = new XMLTransformer(application.getResourceAsStream("/assignment2/location.xsl"),
		  			"http://www-student.it.uts.edu.au/~brookes/gns/location/" + ufi, out);
		  	transformer.transform();
		} 
	} catch (Exception e) {
	
	} %>
</body>
</html>