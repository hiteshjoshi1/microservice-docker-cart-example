/**
 * 
 */
package com.hitesh.microservices.inventory.repository;

import org.springframework.data.repository.CrudRepository;

import com.hitesh.microservices.inventory.models.PrimaryCategory;

/**
 * @author hitjoshi
 *
 */
public interface PrimaryCategoryRepository extends CrudRepository<PrimaryCategory, Long> {

}
