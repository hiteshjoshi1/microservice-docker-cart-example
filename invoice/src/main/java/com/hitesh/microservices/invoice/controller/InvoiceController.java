package com.hitesh.microservices.invoice.controller;

import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hitesh.microservices.invoice.controller.service.InvoiceService;
import com.hitesh.microservices.invoice.dto.OrderDetail;
import com.hitesh.microservices.invoice.models.Invoice;
import com.hitesh.microservices.invoice.repository.InvoiceRepository;

/**
 * @author Hitesh Joshi
 *
 */
@RestController
public class InvoiceController {
	
    protected Logger logger = Logger.getLogger(InvoiceController.class
            .getName());
	
	@Autowired
	InvoiceRepository invoiceRepository;

	@Autowired
	InvoiceService invoiceService;



	@RequestMapping(value="/invoice", method= RequestMethod.GET, produces = "application/json")
	public Iterable<Invoice> getAllInvoice(){        
		return invoiceRepository.findAll();
	}
	/**
	 * Get invoice details by ID
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/invoice/{id}", method= RequestMethod.GET, produces = "application/json")
	public OrderDetail getInvoiceById(@PathVariable("id") String id){        
		return invoiceService.findOrderDetailByInvoiceId(id);
	}
	/**
	 * Get invoice details by Customer ID
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/invoice/custid/{id}", method= RequestMethod.GET, produces = "application/json")
	public List<Invoice> getInvoiceByCustomer(@PathVariable("id") String customerId){        
		logger.info("Findin invoices for Id "+customerId);
		return invoiceRepository.findByCustomerId(Long.parseLong(customerId));
	}

	/*
	 * http://localhost:4444/invoice/new
		POST JSON - 
    {
        "customerId": 2,
        "dateofPurChase": 1507660200000,
        "modePayId": 1,
        "cashierName": "Hari Babu",
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
	 */
	// check if the Inventory has the right quantity
	@RequestMapping(value="/invoice/new", method= RequestMethod.POST, produces = "application/json", consumes = "application/json")
	public OrderDetail createOrder(@RequestBody OrderDetail orderDetail){		
		if(invoiceService.createInvoiceAndOrder(orderDetail)) return orderDetail;
		else return null;
	}


}
