/**
 * 
 */
package com.hitesh.microservices.customer.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.hitesh.microservices.customer.dto.InventoryCheckResultDTO;
import com.hitesh.microservices.customer.dto.Item;
import com.hitesh.microservices.customer.dto.OrderDetail;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;

/**
 * @author hitjoshi
 *
 */
@Service
public class InventoryService {
	protected Logger logger = Logger.getLogger(InventoryService.class
			.getName());

	@Autowired
	RestTemplate restTemplate;

	@HystrixCommand(fallbackMethod = "defaultInventory")
	public List<InventoryCheckResultDTO> checkAvailability(OrderDetail orderDetail) {
		InventoryCheckResultDTO [] inInventoryCheckResultDTOArray = null;
		List<Item> itemList = orderDetail.getItems();
		List<InventoryCheckDTO> inventoryCheckDTOs = new ArrayList<>();
		for(Item item: itemList) {
			InventoryCheckDTO inventoryCheckDTO = new InventoryCheckDTO();
			inventoryCheckDTO.setInventoryId(item.getItemId());
			inventoryCheckDTO.setQuantity(item.getQuantity());
			inventoryCheckDTOs.add(inventoryCheckDTO);
		}
		String serviceUrl = "http://INVENTORY-SERVICE";
		ResponseEntity<InventoryCheckResultDTO []> results = 
				restTemplate.postForEntity(serviceUrl+"/inventory/check", inventoryCheckDTOs, 
						InventoryCheckResultDTO[].class);

		inInventoryCheckResultDTOArray = results.getBody();
		if (inInventoryCheckResultDTOArray == null || inInventoryCheckResultDTOArray.length == 0)
			return new ArrayList<InventoryCheckResultDTO>();
		else
			return Arrays.asList(inInventoryCheckResultDTOArray);
	}


	@SuppressWarnings("unused")
	private List<InventoryCheckResultDTO>  defaultInventory(OrderDetail orderDetail) {
		logger.warning("Fallback method called do something useful....");
		return new ArrayList<InventoryCheckResultDTO>();
	}

	class InventoryCheckDTO{
		private Integer inventoryId;
		private Integer quantity;
		public Integer getInventoryId() {
			return inventoryId;
		}
		public void setInventoryId(Integer inventoryId) {
			this.inventoryId = inventoryId;
		}
		public Integer getQuantity() {
			return quantity;
		}
		public void setQuantity(Integer quantity) {
			this.quantity = quantity;
		}
		@Override
		public String toString() {
			return "InventoryCheckDTO [inventoryId=" + inventoryId + ", quantity=" + quantity + "]";
		}

	}
	@HystrixCommand(fallbackMethod = "updateInventoryFallback")
	public List<InventoryCheckResultDTO>  updateInventory(OrderDetail orderDetail) {
		List<Item> itemList = orderDetail.getItems();
		List<InventoryCheckDTO> inventoryCheckDTOs = new ArrayList<>();
		for(Item item: itemList) {
			InventoryCheckDTO inventoryCheckDTO = new InventoryCheckDTO();
			inventoryCheckDTO.setInventoryId(item.getItemId());
			inventoryCheckDTO.setQuantity(item.getQuantity());
			inventoryCheckDTOs.add(inventoryCheckDTO);
		}
		HttpEntity<List<InventoryCheckDTO>> entity = new HttpEntity<List<InventoryCheckDTO>>(inventoryCheckDTOs);
		
		String serviceUrl = "http://INVENTORY-SERVICE";
		ResponseEntity<InventoryCheckResultDTO []> results = 
				restTemplate.exchange(serviceUrl+"/inventory/update", HttpMethod.PUT, entity, InventoryCheckResultDTO [].class);
		return Arrays.asList(results.getBody());
		
	}
	@SuppressWarnings("unused")
	private List<InventoryCheckResultDTO> updateInventoryFallback(OrderDetail orderDetail) {
		logger.warning("Fallback method for updating inventory called do something useful....");
		return null;
}
}	
