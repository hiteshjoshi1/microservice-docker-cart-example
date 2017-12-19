package com.hitesh.microservices.customer.dto;


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
"modeName",
"modeDesc"
})
public class ModeOfPay {

@JsonProperty("id")
private Integer id;
@JsonProperty("modeName")
private String modeName;
@JsonProperty("modeDesc")
private String modeDesc;
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

@JsonProperty("modeName")
public String getModeName() {
return modeName;
}

@JsonProperty("modeName")
public void setModeName(String modeName) {
this.modeName = modeName;
}

@JsonProperty("modeDesc")
public String getModeDesc() {
return modeDesc;
}

@JsonProperty("modeDesc")
public void setModeDesc(String modeDesc) {
this.modeDesc = modeDesc;
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