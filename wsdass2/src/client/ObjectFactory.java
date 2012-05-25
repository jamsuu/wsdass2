
package client;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the client package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _SayHello_QNAME = new QName("tns:distance", "sayHello");
    private final static QName _SayHelloResponse_QNAME = new QName("tns:distance", "sayHelloResponse");
    private final static QName _GetDistanceResponse_QNAME = new QName("tns:distance", "getDistanceResponse");
    private final static QName _GetDistance_QNAME = new QName("tns:distance", "getDistance");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: client
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link CoordinateType }
     * 
     */
    public CoordinateType createCoordinateType() {
        return new CoordinateType();
    }

    /**
     * Create an instance of {@link GetDistanceResponseType }
     * 
     */
    public GetDistanceResponseType createGetDistanceResponseType() {
        return new GetDistanceResponseType();
    }

    /**
     * Create an instance of {@link SayHelloResponseType }
     * 
     */
    public SayHelloResponseType createSayHelloResponseType() {
        return new SayHelloResponseType();
    }

    /**
     * Create an instance of {@link SayHelloRequestType }
     * 
     */
    public SayHelloRequestType createSayHelloRequestType() {
        return new SayHelloRequestType();
    }

    /**
     * Create an instance of {@link GetDistanceRequestType }
     * 
     */
    public GetDistanceRequestType createGetDistanceRequestType() {
        return new GetDistanceRequestType();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SayHelloRequestType }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "tns:distance", name = "sayHello")
    public JAXBElement<SayHelloRequestType> createSayHello(SayHelloRequestType value) {
        return new JAXBElement<SayHelloRequestType>(_SayHello_QNAME, SayHelloRequestType.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SayHelloResponseType }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "tns:distance", name = "sayHelloResponse")
    public JAXBElement<SayHelloResponseType> createSayHelloResponse(SayHelloResponseType value) {
        return new JAXBElement<SayHelloResponseType>(_SayHelloResponse_QNAME, SayHelloResponseType.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetDistanceResponseType }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "tns:distance", name = "getDistanceResponse")
    public JAXBElement<GetDistanceResponseType> createGetDistanceResponse(GetDistanceResponseType value) {
        return new JAXBElement<GetDistanceResponseType>(_GetDistanceResponse_QNAME, GetDistanceResponseType.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GetDistanceRequestType }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "tns:distance", name = "getDistance")
    public JAXBElement<GetDistanceRequestType> createGetDistance(GetDistanceRequestType value) {
        return new JAXBElement<GetDistanceRequestType>(_GetDistance_QNAME, GetDistanceRequestType.class, null, value);
    }

}
