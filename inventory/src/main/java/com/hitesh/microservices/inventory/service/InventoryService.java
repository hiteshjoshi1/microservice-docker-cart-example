/**
 * 
 */
package com.hitesh.microservices.inventory.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hitesh.microservices.inventory.dto.InventoryDetailDTO;
import com.hitesh.microservices.inventory.models.Inventory;
import com.hitesh.microservices.inventory.repository.InventoryRepository;

/**
 * @author hitjoshi
 *
 */
@Service
public class InventoryService {
	@Autowired
	InventoryRepository inventoryRepository;

	public List<InventoryDetailDTO> checkForInventory(List<InventoryDetailDTO> inventoryDetailDTOList) {
		List<Long> idList = new ArrayList<>();
		Map<Long, InventoryDetailDTO> map = new HashMap<>();
		
		for(InventoryDetailDTO inventoryDetailDTO: inventoryDetailDTOList) {
			idList.add(inventoryDetailDTO.getInventoryId());
			map.put(inventoryDetailDTO.getInventoryId(), inventoryDetailDTO);
		}
		Iterable<Inventory> inventoryList = inventoryRepository.findAll(idList);
		List<InventoryDetailDTO> inventoryDetailDTOResultList = new ArrayList<>();
		for(Inventory inventory: inventoryList) {
			InventoryDetailDTO  inventoryDetailDTO = map.get(inventory.getId());
			inventoryDetailDTO.setAvailableQuantity(inventory.getQuantity());
			inventoryDetailDTO.setTaxRate(inventory.getTaxRate());
			inventoryDetailDTO.setUnitPrice(inventory.getUnitPrice());
			inventoryDetailDTO.setAvailability(inventoryDetailDTO.getQuantity() < inventory.getQuantity());
			inventoryDetailDTOResultList.add(inventoryDetailDTO);
		}
		return inventoryDetailDTOResultList;
	}

	public List<InventoryDetailDTO> updateInventory(List<InventoryDetailDTO> inventoryDetailDTOList) {
		List<Long> idList = new ArrayList<>();
		Map<Long, InventoryDetailDTO> map = new HashMap<>();
		for(InventoryDetailDTO inventoryDetailDTO: inventoryDetailDTOList) {
			idList.add(inventoryDetailDTO.getInventoryId());
			map.put(inventoryDetailDTO.getInventoryId(), inventoryDetailDTO);
		}
		Iterable<Inventory> inventoryList = inventoryRepository.findAll(idList);
		for(Inventory inventory: inventoryList) {
			InventoryDetailDTO inventoryDetailDTO = map.get(inventory.getId());
			inventory.setQuantity(inventory.getQuantity()-inventoryDetailDTO.getQuantity());
			}
		Iterable<Inventory> savedInventory= inventoryRepository.save(inventoryList);
       if(null !=savedInventory) return inventoryDetailDTOList;
       else return null;
	}

}
