/**
 * 
 */
package com.hitesh.microservices.invoice.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hitesh.microservices.invoice.models.Invoice;
import com.hitesh.microservices.invoice.models.Items;

/**
 * @author hitjoshi
 *
 */
public interface ItemsRepository extends CrudRepository<Items, Long> {

	List<Items> findByInvoiceId(Invoice invoiceId);
}
