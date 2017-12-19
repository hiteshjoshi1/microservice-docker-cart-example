/**
 * 
 */
package com.hitesh.microservices.invoice.models;

/**
 * @author hitjoshi
 *
 */
import java.math.BigInteger;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

/**
 * @author hitjoshi
 *
 */
@Entity
@Table(name = "orderitems")
public class Items {

	@Id
	@Column(name="ID")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@ManyToOne(cascade= CascadeType.ALL, fetch= FetchType.EAGER) 
	@JsonManagedReference
	@JoinColumn(name = "INVOICE_ID")
	private Invoice invoiceId;
	
	@Column(name="ITEM_ID")
	private Long itemId;

	@Column(name="QUANTITY", nullable= true)
	private Integer quantity;
	
	@Column(name="TAX_AMT", nullable= true)
	private BigInteger taxAmount;
	
	@Column(name="TOTAL_COST", nullable= true)
	private BigInteger totalCost;

	public Invoice getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(Invoice invoiceId) {
		this.invoiceId = invoiceId;
	}

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public BigInteger getTaxAmount() {
		return taxAmount;
	}

	public void setTaxAmount(BigInteger taxAmount) {
		this.taxAmount = taxAmount;
	}

	public BigInteger getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(BigInteger totalCost) {
		this.totalCost = totalCost;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((invoiceId == null) ? 0 : invoiceId.hashCode());
		result = prime * result + ((itemId == null) ? 0 : itemId.hashCode());
		result = prime * result + ((quantity == null) ? 0 : quantity.hashCode());
		result = prime * result + ((taxAmount == null) ? 0 : taxAmount.hashCode());
		result = prime * result + ((totalCost == null) ? 0 : totalCost.hashCode());
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
		Items other = (Items) obj;
		if (invoiceId == null) {
			if (other.invoiceId != null)
				return false;
		} else if (!invoiceId.equals(other.invoiceId))
			return false;
		if (itemId == null) {
			if (other.itemId != null)
				return false;
		} else if (!itemId.equals(other.itemId))
			return false;
		if (quantity == null) {
			if (other.quantity != null)
				return false;
		} else if (!quantity.equals(other.quantity))
			return false;
		if (taxAmount == null) {
			if (other.taxAmount != null)
				return false;
		} else if (!taxAmount.equals(other.taxAmount))
			return false;
		if (totalCost == null) {
			if (other.totalCost != null)
				return false;
		} else if (!totalCost.equals(other.totalCost))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Items [invoiceId=" + invoiceId + ", itemId=" + itemId + ", quantity=" + quantity + ", taxAmount="
				+ taxAmount + ", totalCost=" + totalCost + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
}
