package com.hitesh.microservices.invoice.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hitesh.microservices.invoice.models.Invoice;

public interface InvoiceRepository  extends CrudRepository<Invoice, Long> {

	List<Invoice> findByCustomerId(Long customerId);
	   
}



