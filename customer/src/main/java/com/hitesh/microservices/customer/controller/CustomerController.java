package com.hitesh.microservices.customer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hitesh.microservices.customer.models.Customer;
import com.hitesh.microservices.customer.repository.CustomerRepository;

/**
 * @author Hitesh Joshi
 *
 */
@RestController
public class CustomerController {
	@Autowired
	CustomerRepository customerRepository;
	
    @RequestMapping(value="/customers", method= RequestMethod.GET, produces = "application/json")
    public Iterable<Customer> getAllCustomers(){        
        return customerRepository.findAll();
    }
    
    @RequestMapping(value="/customers/{id}", method= RequestMethod.GET, produces = "application/json")
    public Customer getCustomerById(@PathVariable("id") String id){        
        return customerRepository.findOne(Long.parseLong(id));
    }
    
    @RequestMapping(value="/customers/name/{name}", method= RequestMethod.GET, produces = "application/json")
    public List<Customer> getCustomerByName(@PathVariable("name") String customerName){        
        return customerRepository.findByCustomerName(customerName);
    }
    
    @RequestMapping(value="/customers/new/", method= RequestMethod.POST, produces = "application/json",consumes = "application/json")
    public Customer addCustomer(@RequestBody Customer customer){
           return customerRepository.save(customer);
    }
}
