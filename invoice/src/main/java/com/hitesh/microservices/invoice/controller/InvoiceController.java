package com.hitesh.microservices.invoice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hitesh.microservices.invoice.models.Invoice;
import com.hitesh.microservices.invoice.repository.InvoiceRepository;

/**
 * @author Hitesh Joshi
 *
 */
@RestController
public class InvoiceController {
	@Autowired
	InvoiceRepository invoiceRepository;
	
    @RequestMapping(value="/invoice", method= RequestMethod.GET, produces = "application/json")
    public Iterable<Invoice> getAllInvoice(){        
        return invoiceRepository.findAll();
    }
    
    @RequestMapping(value="/invoice/{id}", method= RequestMethod.GET, produces = "application/json")
    public Invoice getInvoiceById(@PathVariable("id") String id){        
        return invoiceRepository.findOne(Long.parseLong(id));
    }
    
    @RequestMapping(value="/invoice/custid/{id}", method= RequestMethod.GET, produces = "application/json")
    public List<Invoice> getInvoiceByCustomer(@PathVariable("id") String customerId){        
        return invoiceRepository.findByCustomerId(Long.parseLong(customerId));
    }
    
    @RequestMapping(value="/invoice/new/", method= RequestMethod.POST, produces = "application/json",consumes = "application/json")
    public Invoice addInvoice(@RequestBody Invoice invoice){
           return invoiceRepository.save(invoice);
    }
}
