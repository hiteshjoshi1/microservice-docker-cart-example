/**
 * 
 */
package com.hitesh.microservices.invoice.dto;


import java.util.Date;
/**
 * @author hitjoshi
 *
 */
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
"customerId",
"dateofPurChase",
"modePayId",
"cashierName",
"items"
})
public class OrderDetail {

@JsonProperty("customerId")
private Long customerId;
@JsonProperty("dateofPurChase")
private Date dateofPurChase;
@JsonProperty("modePayId")
private Long modePayId;
@JsonProperty("cashierName")
private String cashierName;
@JsonProperty("items")
private List<Item> items = null;
@JsonIgnore
private Map<String, Object> additionalProperties = new HashMap<String, Object>();

@JsonProperty("customerId")
public Long getCustomerId() {
return customerId;
}

@JsonProperty("customerId")
public void setCustomerId(Long customerId) {
this.customerId = customerId;
}

@JsonProperty("dateofPurChase")
public Date getDateofPurChase() {
return dateofPurChase;
}

@JsonProperty("dateofPurChase")
public void setDateofPurChase(Date dateofPurChase) {
this.dateofPurChase = dateofPurChase;
}

@JsonProperty("modePayId")
public Long getModePayId() {
return modePayId;
}

@JsonProperty("modePayId")
public void setModePayId(Long modePayId) {
this.modePayId = modePayId;
}

@JsonProperty("cashierName")
public String getCashierName() {
return cashierName;
}

@JsonProperty("cashierName")
public void setCashierName(String cashierName) {
this.cashierName = cashierName;
}

@JsonProperty("items")
public List<Item> getItems() {
return items;
}

@JsonProperty("items")
public void setItems(List<Item> items) {
this.items = items;
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