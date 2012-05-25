
package client;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for getDistanceRequestType complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="getDistanceRequestType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;all>
 *         &lt;element name="sourceLocation" type="{tns:distance}coordinateType" form="unqualified"/>
 *         &lt;element name="destinationLocation" type="{tns:distance}coordinateType" form="unqualified"/>
 *         &lt;element name="units" type="{tns:distance}unitsType" form="unqualified"/>
 *       &lt;/all>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "getDistanceRequestType", propOrder = {

})
public class GetDistanceRequestType {

    @XmlElement(required = true)
    protected CoordinateType sourceLocation;
    @XmlElement(required = true)
    protected CoordinateType destinationLocation;
    @XmlElement(required = true)
    protected String units;

    /**
     * Gets the value of the sourceLocation property.
     * 
     * @return
     *     possible object is
     *     {@link CoordinateType }
     *     
     */
    public CoordinateType getSourceLocation() {
        return sourceLocation;
    }

    /**
     * Sets the value of the sourceLocation property.
     * 
     * @param value
     *     allowed object is
     *     {@link CoordinateType }
     *     
     */
    public void setSourceLocation(CoordinateType value) {
        this.sourceLocation = value;
    }

    /**
     * Gets the value of the destinationLocation property.
     * 
     * @return
     *     possible object is
     *     {@link CoordinateType }
     *     
     */
    public CoordinateType getDestinationLocation() {
        return destinationLocation;
    }

    /**
     * Sets the value of the destinationLocation property.
     * 
     * @param value
     *     allowed object is
     *     {@link CoordinateType }
     *     
     */
    public void setDestinationLocation(CoordinateType value) {
        this.destinationLocation = value;
    }

    /**
     * Gets the value of the units property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getUnits() {
        return units;
    }

    /**
     * Sets the value of the units property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setUnits(String value) {
        this.units = value;
    }

}
