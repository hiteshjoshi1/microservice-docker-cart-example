/**
 * 
 */
package com.hitesh.microservices.inventory.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hitesh.microservices.inventory.models.SecondaryCategory;
import com.hitesh.microservices.inventory.models.TertiaryCategory;

/**
 * @author hitjoshi
 *
 */
public interface TertiaryCategoryRepository extends CrudRepository<TertiaryCategory, Long> {

	public List<TertiaryCategory> findBySecondaryCategory(SecondaryCategory secondaryCategory);
	
}