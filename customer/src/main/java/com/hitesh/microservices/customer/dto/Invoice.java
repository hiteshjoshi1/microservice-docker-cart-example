package com.hitesh.microservices.customer.dto;

import java.io.Serializable;
import java.util.Date;
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
"id",
"customerId",
"itemId",
"quantity",
"dateOfPurchase",
"modeOfPay",
"taxAmount",
"cashierName",
"paymentMode"
})
public class Invoice implements Serializable {

private static final long serialVersionUID = 1L;
@JsonProperty("id")
private Integer id;
@JsonProperty("customerId")
private Integer customerId;
@JsonProperty("itemId")
private Integer itemId;
@JsonProperty("quantity")
private Integer quantity;
@JsonProperty("dateOfPurchase")
private Date dateOfPurchase;
@JsonProperty("modeOfPay")
private ModeOfPay modeOfPay;
@JsonProperty("taxAmount")
private Double taxAmount;
@JsonProperty("cashierName")
private String cashierName;

@JsonIgnore
private Map<String, Object> additionalProperties = new HashMap<String, Object>();

@JsonProperty("id")
public Integer getId() {
return id;
}

@JsonProperty("id")
public void setId(Integer id) {
this.id = id;
}

@JsonProperty("customerId")
public Integer getCustomerId() {
return customerId;
}

@JsonProperty("customerId")
public void setCustomerId(Integer customerId) {
this.customerId = customerId;
}

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

@JsonProperty("dateOfPurchase")
public Date getDateOfPurchase() {
return dateOfPurchase;
}

@JsonProperty("dateOfPurchase")
public void setDateOfPurchase(Date dateOfPurchase) {
this.dateOfPurchase = dateOfPurchase;
}

@JsonProperty("modeOfPay")
public ModeOfPay getModeOfPay() {
return modeOfPay;
}

@JsonProperty("modeOfPay")
public void setModeOfPay(ModeOfPay modeOfPay) {
this.modeOfPay = modeOfPay;
}

@JsonProperty("taxAmount")
public Double getTaxAmount() {
return taxAmount;
}

@JsonProperty("taxAmount")
public void setTaxAmount(Double taxAmount) {
this.taxAmount = taxAmount;
}

@JsonProperty("cashierName")
public String getCashierName() {
return cashierName;
}

@JsonProperty("cashierName")
public void setCashierName(String cashierName) {
this.cashierName = cashierName;
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



