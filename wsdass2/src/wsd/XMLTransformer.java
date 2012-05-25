package wsd;

import java.io.InputStream;
import javax.servlet.jsp.JspWriter;
import javax.xml.transform.*;
import javax.xml.transform.stream.*;

public class XMLTransformer {
	
	private static TransformerFactory tfFactory = TransformerFactory.newInstance();
	
	private StreamSource xmlSource;
	private StreamSource xsltSource;
	private StreamResult fileResult;
	private Transformer transformer;
	
	public XMLTransformer(InputStream xslPath, String xmlPath, JspWriter out) {
		initialise(xslPath, xmlPath, out);
	}
	
	public void setParameter(String key, String value) {
		transformer.setParameter(key, value);
	}
	
	private void initialise(InputStream xslPath, String xmlPath, JspWriter out) {
		try {
			InputStream xsls = xslPath;
			xmlSource = new StreamSource(xmlPath);
			xsltSource = new StreamSource(xsls);
			fileResult = new StreamResult(out);
			transformer = tfFactory.newTransformer(xsltSource);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void transform() {
		try {
			transformer.transform(xmlSource, fileResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
