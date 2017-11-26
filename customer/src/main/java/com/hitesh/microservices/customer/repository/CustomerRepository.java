package com.hitesh.microservices.customer.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hitesh.microservices.customer.models.Customer;

public interface CustomerRepository  extends CrudRepository<Customer, Long> {
	   List<Customer> findByCustomerName(String customerName); 

}



