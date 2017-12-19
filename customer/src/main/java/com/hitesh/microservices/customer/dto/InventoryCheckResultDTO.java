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
	"inventoryId",
	"quantity",
	"availableQuantity",
	"taxRate",
	"availability"
})
public class InventoryCheckResultDTO {

	@JsonProperty("inventoryId")
	private Integer inventoryId;
	@JsonProperty("quantity")
	private Integer quantity;
	@JsonProperty("availableQuantity")
	private Integer availableQuantity;
	@JsonProperty("taxRate")
	private Integer taxRate;
	@JsonProperty("availability")
	private Boolean availability;
	@JsonIgnore
	private Map<String, Object> additionalProperties = new HashMap<String, Object>();

	@JsonProperty("inventoryId")
	public Integer getInventoryId() {
		return inventoryId;
	}

	@JsonProperty("inventoryId")
	public void setInventoryId(Integer inventoryId) {
		this.inventoryId = inventoryId;
	}

	@JsonProperty("quantity")
	public Integer getQuantity() {
		return quantity;
	}

	@JsonProperty("quantity")
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	@JsonProperty("availableQuantity")
	public Integer getAvailableQuantity() {
		return availableQuantity;
	}

	@JsonProperty("availableQuantity")
	public void setAvailableQuantity(Integer availableQuantity) {
		this.availableQuantity = availableQuantity;
	}

	@JsonProperty("taxRate")
	public Integer getTaxRate() {
		return taxRate;
	}

	@JsonProperty("taxRate")
	public void setTaxRate(Integer taxRate) {
		this.taxRate = taxRate;
	}

	@JsonProperty("availability")
	public Boolean getAvailability() {
		return availability;
	}

	@JsonProperty("availability")
	public void setAvailability(Boolean availability) {
		this.availability = availability;
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
	public String toString() {
		return "InventoryCheckResultDTO [inventoryId=" + inventoryId + ", quantity=" + quantity + ", availableQuantity="
				+ availableQuantity + ", taxRate=" + taxRate + ", availability=" + availability
				+ ", additionalProperties=" + additionalProperties + "]";
	}

}


