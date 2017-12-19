/**
 * 
 */
package com.hitesh.microservices.customer.dto;


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
private Integer customerId;
@JsonProperty("dateofPurChase")
private Date dateofPurChase;
@JsonProperty("modePayId")
private Integer modePayId;
@JsonProperty("cashierName")
private String cashierName;
@JsonProperty("items")
private List<Item> items = null;
@JsonIgnore
private Map<String, Object> additionalProperties = new HashMap<String, Object>();

@JsonProperty("customerId")
public Integer getCustomerId() {
return customerId;
}

@JsonProperty("customerId")
public void setCustomerId(Integer customerId) {
this.customerId = customerId;
}

@JsonProperty("modePayId")
public Integer getModePayId() {
return modePayId;
}

@JsonProperty("modePayId")
public void setModePayId(Integer modePayId) {
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

@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((additionalProperties == null) ? 0 : additionalProperties.hashCode());
	result = prime * result + ((cashierName == null) ? 0 : cashierName.hashCode());
	result = prime * result + ((customerId == null) ? 0 : customerId.hashCode());
	result = prime * result + ((items == null) ? 0 : items.hashCode());
	result = prime * result + ((modePayId == null) ? 0 : modePayId.hashCode());
	return result;
}

@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	OrderDetail other = (OrderDetail) obj;
	if (additionalProperties == null) {
		if (other.additionalProperties != null)
			return false;
	} else if (!additionalProperties.equals(other.additionalProperties))
		return false;
	if (cashierName == null) {
		if (other.cashierName != null)
			return false;
	} else if (!cashierName.equals(other.cashierName))
		return false;
	if (customerId == null) {
		if (other.customerId != null)
			return false;
	} else if (!customerId.equals(other.customerId))
		return false;
	if (items == null) {
		if (other.items != null)
			return false;
	} else if (!items.equals(other.items))
		return false;
	if (modePayId == null) {
		if (other.modePayId != null)
			return false;
	} else if (!modePayId.equals(other.modePayId))
		return false;
	return true;
}

@Override
public String toString() {
	return "OrderDetail [customerId=" + customerId + ", modePayId=" + modePayId + ", cashierName=" + cashierName
			+ ", items=" + items + ", additionalProperties=" + additionalProperties + "]";
}

public Date getDateofPurChase() {
	return dateofPurChase;
}

public void setDateofPurChase(Date dateofPurChase) {
	this.dateofPurChase = dateofPurChase;
}

}