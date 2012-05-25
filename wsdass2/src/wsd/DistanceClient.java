package wsd;

import client.*;
import java.math.*;

public class DistanceClient {
	public static void main(String args[]) {
		ObjectFactory factory = new ObjectFactory();
		
		Distance service = new Distance();
		DistancePortType port = service.getDistancePort();
		
		CoordinateType source = factory.createCoordinateType();
		BigDecimal latitude = new BigDecimal(-33.886823);
		BigDecimal longitude = new BigDecimal(150.931184);
		source.setLatitude(latitude);
		source.setLongitude(longitude);

		CoordinateType destination = factory.createCoordinateType();
		latitude = new BigDecimal(37.09024);
		longitude = new BigDecimal(-95.712891);
		destination.setLatitude(latitude);
		destination.setLongitude(longitude);
		
		GetDistanceRequestType request = factory.createGetDistanceRequestType();
		GetDistanceResponseType response = factory.createGetDistanceResponseType();

		request.setSourceLocation(source);
		request.setDestinationLocation(destination);
		request.setUnits("miles");
		
		response = port.getDistance(request);
		
		BigDecimal distance = response.getDistance();
		
		System.out.println(distance.toPlainString());
		
	}
}