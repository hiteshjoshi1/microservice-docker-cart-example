package com.hitesh.microservices.inventory.dto;

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
"secondaryCatId",
"secondaryCatName",
"tertiaryCategories"
})
public class FullCategoryDTO {

@JsonProperty("secondaryCatId")
private Long secondaryCatId;
@JsonProperty("secondaryCatName")
private String secondaryCatName;
@JsonProperty("tertiaryCategories")
private List<TertiaryCategoryDTO> tertiaryCategories = null;
@JsonIgnore
private Map<String, Object> additionalProperties = new HashMap<String, Object>();

@JsonProperty("secondaryCatId")
public Long getSecondaryCatId() {
return secondaryCatId;
}

@JsonProperty("secondaryCatId")
public void setSecondaryCatId(Long secondaryCatId) {
this.secondaryCatId = secondaryCatId;
}

@JsonProperty("tertiaryCategories")
public List<TertiaryCategoryDTO> getTertiaryCategories() {
return tertiaryCategories;
}

@JsonProperty("tertiaryCategories")
public void setTertiaryCategories(List<TertiaryCategoryDTO> tertiaryCategories) {
this.tertiaryCategories = tertiaryCategories;
}

@JsonAnyGetter
public Map<String, Object> getAdditionalProperties() {
return this.additionalProperties;
}

@JsonAnySetter
public void setAdditionalProperty(String name, Object value) {
this.additionalProperties.put(name, value);
}

public String getSecondaryCatName() {
	return secondaryCatName;
}

public void setSecondaryCatName(String secondaryCatName) {
	this.secondaryCatName = secondaryCatName;
}

}