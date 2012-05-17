<%@	page language="java"
	import="javax.xml.parsers.*"
 	import="org.w3c.dom.*"
 	import="java.io.*"
	import="javax.xml.transform.*"
	import="javax.xml.transform.stream.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>WSD Assignment 2 - Lookup Tables</title>
</head>
<body bgcolor='#FFBF00'>
<% 
try {
		InputStream xsls = application.getResourceAsStream("/Assignment2 Part2/Ass2xsl.xsl");
		StreamSource xmlSource = new StreamSource("http://www-student.it.uts.edu.au/~brookes/gns/lookup/administrative_division");
		StreamSource xsltSource = new StreamSource(xsls);
		StreamResult fileResult = new StreamResult(out);
		TransformerFactory tfFactory = TransformerFactory.newInstance();
		Transformer transformer = tfFactory.newTransformer(xsltSource);
	  	transformer.transform(xmlSource, fileResult); 
}
catch (Exception e) {} %>
<%
String name = request.getParameter("firstname");
if (name != null)
	out.println(name);
%>
</body>
</html>