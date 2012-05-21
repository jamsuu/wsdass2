<%@	page language="java"
         import="javax.xml.parsers.*,org.w3c.dom.*,java.io.*,javax.xml.transform.*,javax.xml.transform.stream.*,java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<link rel="stylesheet" href="css/style.css" />
	<title>WSD Assignment 2 - Lookup Tables</title>
</head>
<body>
<% try { %>
	<form method="get">
	    <%
		InputStream xsls = application.getResourceAsStream("/assignment2_part2/designation_dropdown.xsl");
		StreamSource xmlSource = new StreamSource("http://www-student.it.uts.edu.au/~brookes/gns/lookup/designation");
		StreamSource xsltSource = new StreamSource(xsls);
		StreamResult fileResult = new StreamResult(out);
		TransformerFactory tfFactory = TransformerFactory.newInstance();
		Transformer transformer = tfFactory.newTransformer(xsltSource);
	  	transformer.transform(xmlSource, fileResult);

		xsls = application.getResourceAsStream("/assignment2_part2/division_dropdown.xsl");
		xmlSource = new StreamSource("http://www-student.it.uts.edu.au/~brookes/gns/lookup/administrative_division");
		xsltSource = new StreamSource(xsls);
		fileResult = new StreamResult(out);
		
		transformer = tfFactory.newTransformer(xsltSource);
	  	transformer.transform(xmlSource, fileResult); 
	  	%>
		<input type="text" name="name" />
		<input type="submit" />
	</form>
	    <% if (request.getQueryString() != null) {
	    	String designation = request.getParameter("designation") == null ? "" : request.getParameter("designation");
			String division = request.getParameter("administrative_division") == null ? "" : request.getParameter("administrative_division");
			String nametype = request.getParameter("name") == null ? "" : request.getParameter("name"); 
			
			String query = designation.length() > 0 ? "/designation/" + designation : "";
			query += division.length() > 0 ? "/administrative_division/" + division : "";
			query += nametype.length() > 0 ? "/name/" + nametype : ""; 	 
			
			
			xsls = application.getResourceAsStream("/assignment2_part2/features_table.xsl");
			xmlSource = new StreamSource("http://www-student.it.uts.edu.au/~brookes/gns/features" + query);
			xsltSource = new StreamSource(xsls);
			fileResult = new StreamResult(out);
			
			transformer = tfFactory.newTransformer(xsltSource);
			String primary_sort = request.getParameter("sort_by") == null ? "sort_key" : request.getParameter("sort_by"); 			
			transformer.setParameter("sort_by", primary_sort);
			transformer.setParameter("designation", designation);
			transformer.setParameter("division", division);
			transformer.setParameter("nametype", nametype);
		  	transformer.transform(xmlSource, fileResult);
		} 
	} catch (Exception e) {
	
	} %>
</body>
</html>