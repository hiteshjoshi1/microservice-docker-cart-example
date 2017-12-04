package com.hitesh.microservices.invoice.repository;

import org.springframework.data.repository.CrudRepository;

import com.hitesh.microservices.invoice.models.Invoice;

public interface InvoiceRepository  extends CrudRepository<Invoice, Long> {
	   
}



