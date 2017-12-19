/**
 * 
 */
package com.hitesh.microservices.customer.services;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.hitesh.microservices.customer.dto.Invoice;
import com.hitesh.microservices.customer.dto.OrderDetail;
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
	private static final String SERVICE_HOSTNAME = "http://INVOICE-SERVICE";
	
	 @HystrixCommand(fallbackMethod = "defaultInvoices")
	 public List<Invoice> getInvoices(String custId) {
		 Invoice [] invoices = null;

	        logger.info("get all orders() invoked: for " + custId);
	        invoices = restTemplate.getForObject(SERVICE_HOSTNAME + "/invoice/custid/{custId}",
	        		Invoice[].class, custId);
	        if (invoices == null || invoices.length == 0)
	            return new ArrayList<Invoice>();
	        else
	            return Arrays.asList(invoices);
	    }
	    
	  
	    @SuppressWarnings("unused")
		private List<Invoice> defaultInvoices(String custId) {
	        List<Invoice> invoiceList = new ArrayList<Invoice>();
	        Invoice invoice  = new Invoice();
	        invoice.setCashierName("NO records found");
	        invoiceList.add(invoice);
	        return invoiceList;
	    }
	    /**
	     * http://localhost:4444/invoice/new
	     * {
    "customerId": 2,
    "dateofPurChase": 1507660200000,
    "modePayId": 1,
    "cashierName": "Ohm Isht Devaye Namah",
    "items": [
        {
            "itemId": 3,
            "quantity": 9,
            "taxAmount": 4,
            "unitCost": 100
        },
        {
            "itemId": 4,
            "quantity": 90,
            "taxAmount": 4,
            "unitCost": 1100
        }
    ]
}
	     * @param orderDetail
	     * @return
	     */
	    
	    @HystrixCommand(fallbackMethod="inventoryCreationFailure")
	    public OrderDetail createInvoice(OrderDetail orderDetail) {
	        logger.info("create invoice call  " + orderDetail);
			ResponseEntity<OrderDetail> results = 
					restTemplate.postForEntity(SERVICE_HOSTNAME+"/invoice/new", orderDetail, 
							OrderDetail.class);
			OrderDetail finalResp = results.getBody();
			if(null!= finalResp) return finalResp;
			else return null;

	    }
	    
	    @SuppressWarnings("unused")
		private OrderDetail inventoryCreationFailure(OrderDetail orderDetail) {
	    	logger.info("Fallback method for invoice creation... Do something useful");
	    	return null;
	    }
	    

}
