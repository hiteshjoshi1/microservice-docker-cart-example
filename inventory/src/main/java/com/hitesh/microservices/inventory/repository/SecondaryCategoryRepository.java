/**
 * 
 */
package com.hitesh.microservices.inventory.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hitesh.microservices.inventory.models.PrimaryCategory;
import com.hitesh.microservices.inventory.models.SecondaryCategory;

/**
 * @author hitjoshi
 *
 */
public interface SecondaryCategoryRepository extends CrudRepository<SecondaryCategory, Long> {

	public List<SecondaryCategory> findByPrimaryCategory(PrimaryCategory primaryCategory);
	
}
