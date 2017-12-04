package com.hitesh.microservices.invoice.models;

import java.io.Serializable;
import java.util.Date;

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
@Table(name = "invoice")
public class Invoice implements Serializable {

	private static final long serialVersionUID = -3869826235658717494L;

	@Id
	@Column(name="ID")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;

	@Column(name="CUST_ID")
	private Long customerId;

	@Column(name="ITEM_ID")
	private Long itemId;


	@Column(name="QUANTITY", nullable= true)
	private Integer quantity;

	@Column(name="DATE_OF_PURCHASE")
	private Date dateOfPurchase;


	@ManyToOne(cascade= CascadeType.ALL, fetch= FetchType.EAGER) 
	@JsonManagedReference
	@JoinColumn(name = "MODE_PAY_ID")
	private ModeOfPay modeOfPay;
	
	@Column(name="TAX_AMT",nullable=true)
	private Double taxAmount;

	@Column(name="CASHIER_NAME",nullable=true)
	private String cashierName;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
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

	public Date getDateOfPurchase() {
		return dateOfPurchase;
	}

	public void setDateOfPurchase(Date dateOfPurchase) {
		this.dateOfPurchase = dateOfPurchase;
	}

	public ModeOfPay getPaymentMode() {
		return modeOfPay;
	}

	public void setPaymentMode(ModeOfPay paymentMode) {
		this.modeOfPay = paymentMode;
	}

	public Double getTaxAmount() {
		return taxAmount;
	}

	public void setTaxAmount(Double taxAmount) {
		this.taxAmount = taxAmount;
	}

	public String getCashierName() {
		return cashierName;
	}

	public void setCashierName(String cashierName) {
		this.cashierName = cashierName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cashierName == null) ? 0 : cashierName.hashCode());
		result = prime * result + ((customerId == null) ? 0 : customerId.hashCode());
		result = prime * result + ((dateOfPurchase == null) ? 0 : dateOfPurchase.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((itemId == null) ? 0 : itemId.hashCode());
		result = prime * result + ((modeOfPay == null) ? 0 : modeOfPay.hashCode());
		result = prime * result + ((quantity == null) ? 0 : quantity.hashCode());
		result = prime * result + ((taxAmount == null) ? 0 : taxAmount.hashCode());
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
		Invoice other = (Invoice) obj;
		if (cashierName == null) {
			if (other.cashierName != null)
				return false;
		} else if (!cashierName.equals(other.cashierName))
			return false;
		if (customerId == null) {
			if (other.customerId != null)
				return false;
		} else if (!customerId.equals(other.customerId))
			return false;
		if (dateOfPurchase == null) {
			if (other.dateOfPurchase != null)
				return false;
		} else if (!dateOfPurchase.equals(other.dateOfPurchase))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (itemId == null) {
			if (other.itemId != null)
				return false;
		} else if (!itemId.equals(other.itemId))
			return false;
		if (modeOfPay == null) {
			if (other.modeOfPay != null)
				return false;
		} else if (!modeOfPay.equals(other.modeOfPay))
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
		return true;
	}

	
	

	
}
