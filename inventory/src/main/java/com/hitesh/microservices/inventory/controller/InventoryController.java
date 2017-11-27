package com.hitesh.microservices.inventory.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hitesh.microservices.inventory.models.Inventory;
import com.hitesh.microservices.inventory.repository.InventoryRepository;

/**
 * @author Hitesh Joshi
 *
 */
@RestController
public class InventoryController {
	@Autowired
	InventoryRepository inventoryRepository;
	
    @RequestMapping(value="/inventory", method= RequestMethod.GET, produces = "application/json")
    public Iterable<Inventory> getAllinventory(){        
        return inventoryRepository.findAll();
    }
    
    @RequestMapping(value="/inventory/{id}", method= RequestMethod.GET, produces = "application/json")
    public Inventory getInventoryById(@PathVariable("id") String id){        
        return inventoryRepository.findOne(Long.parseLong(id));
    }
    
//    @RequestMapping(value="/inventory/name/{name}", method= RequestMethod.GET, produces = "application/json")
//    public List<Inventory> getInventoryByName(@PathVariable("name") String InventoryName){        
//        return inventoryRepository.findByInventoryName(InventoryName);
//    }
    
    @RequestMapping(value="/inventory/new/", method= RequestMethod.POST, produces = "application/json",consumes = "application/json")
    public Inventory addInventory(@RequestBody Inventory inventory){
           return inventoryRepository.save(inventory);
    }
}
