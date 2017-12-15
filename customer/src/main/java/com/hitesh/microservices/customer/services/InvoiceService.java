/**
 * 
 */
package com.hitesh.microservices.customer.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.hitesh.microservices.customer.models.Invoice;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;

/**
 * @author hitjoshi
 * Service which will call Invoice Microservice and Agg data
 *
 */
@Service
public class InvoiceService {
    protected Logger logger = Logger.getLogger(InvoiceService.class
            .getName());
	
	@Autowired
	RestTemplate restTemplate;
	
	 @HystrixCommand(fallbackMethod = "defaultInvoices")
	 public List<Invoice> getInvoices(String custId) {
		 Invoice [] invoices = null;
		  String serviceUrl = "http://INVOICE-SERVICE";
	        logger.info("get all orders() invoked: for " + custId);
	        invoices = restTemplate.getForObject(serviceUrl + "/invoice/custid/{custId}",
	        		Invoice[].class, custId);
	        if (invoices == null || invoices.length == 0)
	            return new ArrayList<Invoice>();
	        else
	            return Arrays.asList(invoices);
	    }
	    
	  
	    private List<Invoice> defaultInvoices(String custId) {
	        List<Invoice> invoiceList = new ArrayList<Invoice>();
	        Invoice invoice  = new Invoice();
	        invoice.setCashierName("NO records found");
	        invoiceList.add(invoice);
	        return invoiceList;
	    }
}
