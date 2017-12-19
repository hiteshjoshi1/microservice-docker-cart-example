/**
 * 
 */
package com.hitesh.microservices.customer.dto;

import java.io.Serializable;
import java.util.List;

import com.hitesh.microservices.customer.models.Customer;

/**
 * @author hitjoshi
 * Ideally this should not expose Model objects
 * And we should have a converter between Model and DTO
 */
public class CustomerOrders implements Serializable {

	private static final long serialVersionUID = 6277290364351001063L;
	private Customer customer;
	private List<Invoice> invoiceList;
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public List<Invoice> getInvoiceList() {
		return invoiceList;
	}
	public void setInvoiceList(List<Invoice> invoiceList) {
		this.invoiceList = invoiceList;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((customer == null) ? 0 : customer.hashCode());
		result = prime * result + ((invoiceList == null) ? 0 : invoiceList.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CustomerOrders other = (CustomerOrders) obj;
		if (customer == null) {
			if (other.customer != null)
				return false;
		} else if (!customer.equals(other.customer))
			return false;
		if (invoiceList == null) {
			if (other.invoiceList != null)
				return false;
		} else if (!invoiceList.equals(other.invoiceList))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "CustomerOrders [customer=" + customer + ", invoiceList=" + invoiceList + "]";
	}
	
}
