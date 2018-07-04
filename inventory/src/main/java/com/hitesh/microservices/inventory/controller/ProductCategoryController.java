/**
 * 
 */
package com.hitesh.microservices.inventory.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hitesh.microservices.inventory.dto.FullCategoryDTO;
import com.hitesh.microservices.inventory.dto.PrimaryCategoryDTO;
import com.hitesh.microservices.inventory.service.ProductService;

/**
 * @author hitjoshi
 *
 */
@RestController
public class ProductCategoryController {

	@Autowired
	ProductService productService; 
	
	@RequestMapping(value="/category/primary", method= RequestMethod.GET, produces = "application/json")
	public List<PrimaryCategoryDTO> getPrimaryCategory(){        
		return productService.fetchPrimaryCategories();
	}
	
	@RequestMapping(value="/category/secondary", method= RequestMethod.GET, produces = "application/json")
	public List<FullCategoryDTO> getSecondaryCategories(@RequestParam("categoryId") String categoryId  ){        
		return productService.fetchAllCategoryById(categoryId);
	}
	
	

}
