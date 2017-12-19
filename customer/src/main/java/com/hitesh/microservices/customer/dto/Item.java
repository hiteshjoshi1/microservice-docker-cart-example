/**
 * 
 */
package com.hitesh.microservices.customer.dto;

/**
 * @author hitjoshi
 *
 */
import java.util.HashMap;
import java.util.Map;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
"itemId",
"quantity",
"taxAmount",
"unitCost"
})
public class Item {

@JsonProperty("itemId")
private Integer itemId;
@JsonProperty("quantity")
private Integer quantity;
@JsonProperty("taxAmount")
private Double taxAmount;
@JsonProperty("unitCost")
private Integer unitCost;
@JsonIgnore
private Map<String, Object> additionalProperties = new HashMap<String, Object>();

@JsonProperty("itemId")
public Integer getItemId() {
return itemId;
}

@JsonProperty("itemId")
public void setItemId(Integer itemId) {
this.itemId = itemId;
}

@JsonProperty("quantity")
public Integer getQuantity() {
return quantity;
}

@JsonProperty("quantity")
public void setQuantity(Integer quantity) {
this.quantity = quantity;
}

@JsonProperty("taxAmount")
public Double getTaxAmount() {
return taxAmount;
}

@JsonProperty("taxAmount")
public void setTaxAmount(Double taxAmount) {
this.taxAmount = taxAmount;
}

@JsonProperty("unitCost")
public Integer getUnitCost() {
return unitCost;
}

@JsonProperty("unitCost")
public void setUnitCost(Integer unitCost) {
this.unitCost = unitCost;
}

@JsonAnyGetter
public Map<String, Object> getAdditionalProperties() {
return this.additionalProperties;
}

@JsonAnySetter
public void setAdditionalProperty(String name, Object value) {
this.additionalProperties.put(name, value);
}

}
