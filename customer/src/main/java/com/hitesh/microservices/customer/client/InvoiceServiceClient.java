/**
 * 
 */
package com.hitesh.microservices.customer.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hitesh.microservices.customer.models.Invoice;

/**
 * @author hitjoshi
 *
 */
@FeignClient(name = "invoice-service",
fallback = InvoiceServiceClient.InvoiceClientFallback.class)
public interface InvoiceServiceClient {

	@RequestMapping(method = RequestMethod.GET, value = "/invoice/custid/{custid}", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	List<Invoice> getInvoices(@PathVariable("custid") String custid);

/**
 * Circuit Breaker code, This will run if Invoice-service is down
 * @author hitjoshi
 *
 */	
	@Component
	static class InvoiceClientFallback implements InvoiceServiceClient{
		@Override	
		public List<Invoice> getInvoices(String custId) {
			List<Invoice> invoiceList = new ArrayList<Invoice>();
			Invoice invoice  = new Invoice();
			invoice.setCashierName("NO records found");
			invoiceList.add(invoice);
			return invoiceList;
		}
	}
}



