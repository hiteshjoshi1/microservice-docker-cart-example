/**
 * 
 */
package com.hitesh.microservices.invoice.repository;

import org.springframework.data.repository.CrudRepository;

import com.hitesh.microservices.invoice.models.ModeOfPay;

/**
 * @author hitjoshi
 *
 */
public interface ModeOfPayRepository extends CrudRepository<ModeOfPay, Long> {

}
