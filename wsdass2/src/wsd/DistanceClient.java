package wsd;

import client.*;
import java.math.*;

import javax.xml.parsers.*;
import javax.xml.xpath.*;
import org.w3c.dom.*;

public class DistanceClient {
	
	private static ObjectFactory objFactory = new ObjectFactory();
	private static DocumentBuilder builder;
	
	static {
		try {
			DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
			builder = docFactory.newDocumentBuilder();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static CoordinateType getCoordinates(String ufi) throws Exception {
		Document doc = builder.parse("http://www-student.it.uts.edu.au/~brookes/gns/location/" + ufi);
		XPathFactory xpathFactory = XPathFactory.newInstance();
		XPath xpath = xpathFactory.newXPath();
		
		XPathExpression expr = xpath.compile("/location/latitude/text()");
		Node latitude = (Node) expr.evaluate(doc, XPathConstants.NODE);
		
		expr = xpath.compile("/location/longitude/text()");
		Node longitude = (Node) expr.evaluate(doc, XPathConstants.NODE);
		
		CoordinateType coords = objFactory.createCoordinateType();
		coords.setLatitude(new BigDecimal(latitude.getNodeValue()));
		coords.setLongitude(new BigDecimal(longitude.getNodeValue()));
		
		return coords;
	}
	
	public static GetDistanceResponseType getDistance(String source, String destination) throws Exception {
		CoordinateType sourceCoords = getCoordinates("-1559369");
		CoordinateType destinationCoords = getCoordinates("-1582806");
		
		Distance service = new Distance();
		DistancePortType port = service.getDistancePort();
		
		GetDistanceRequestType request = objFactory.createGetDistanceRequestType();

		request.setSourceLocation(sourceCoords);
		request.setDestinationLocation(destinationCoords);
		request.setUnits("miles");

		return port.getDistance(request);
	}
}