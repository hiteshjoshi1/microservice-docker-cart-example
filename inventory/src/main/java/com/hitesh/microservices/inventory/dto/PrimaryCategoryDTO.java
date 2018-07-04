/**
 * 
 */
package com.hitesh.microservices.inventory.dto;

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
"categoryName",
"categoryId"
})
public class PrimaryCategoryDTO {

@JsonProperty("categoryName")
private String categoryName;
@JsonProperty("categoryId")
private Long categoryId;
@JsonIgnore
private Map<String, Object> additionalProperties = new HashMap<String, Object>();

@JsonProperty("categoryName")
public String getCategoryName() {
return categoryName;
}

@JsonProperty("categoryName")
public void setCategoryName(String categoryName) {
this.categoryName = categoryName;
}

@JsonProperty("categoryId")
public Long getCategoryId() {
return categoryId;
}

@JsonProperty("categoryId")
public void setCategoryId(Long categoryId) {
this.categoryId = categoryId;
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