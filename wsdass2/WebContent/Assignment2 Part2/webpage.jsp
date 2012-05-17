<%@ 	page language="java"%>
<%@ 	page import="javax.xml.parsers.*" %>
<%@ 	page import="org.w3c.dom.*" %>
<%@ 	page import="java.io.*"%>
<%@ 	page import="javax.xml.transform.*"%>
<%@		page import="javax.xml.transform.stream.*" %>
asdasd
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
