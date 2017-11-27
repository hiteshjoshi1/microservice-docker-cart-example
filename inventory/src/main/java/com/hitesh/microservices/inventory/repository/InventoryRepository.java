package com.hitesh.microservices.inventory.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hitesh.microservices.inventory.models.Inventory;

public interface InventoryRepository  extends CrudRepository<Inventory, Long> {
	   
}



