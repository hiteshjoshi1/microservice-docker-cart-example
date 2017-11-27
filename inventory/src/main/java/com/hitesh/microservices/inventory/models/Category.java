/**
 * 
 */
package com.hitesh.microservices.inventory.models;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author hitjoshi
 *
 */
@Entity
@Table(name = "categories")
public class Category implements Serializable {

	private static final long serialVersionUID = -8950869742097889813L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID")
	private Long id;
	
	@Column(name="CATEGORY_NAME")
	private String categoryName;
	
	@Column(name="CONTROLLED")
	private Boolean controlled;


	@ManyToOne(cascade= CascadeType.ALL, fetch= FetchType.EAGER) 
	private UnitType unitType;
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Boolean getControlled() {
		return controlled;
	}

	public void setControlled(Boolean controlled) {
		this.controlled = controlled;
	}

	public UnitType getUnitType() {
		return unitType;
	}

	public void setUnitType(UnitType unitType) {
		this.unitType = unitType;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((categoryName == null) ? 0 : categoryName.hashCode());
		result = prime * result + ((controlled == null) ? 0 : controlled.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((unitType == null) ? 0 : unitType.hashCode());
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
		Category other = (Category) obj;
		if (categoryName == null) {
			if (other.categoryName != null)
				return false;
		} else if (!categoryName.equals(other.categoryName))
			return false;
		if (controlled == null) {
			if (other.controlled != null)
				return false;
		} else if (!controlled.equals(other.controlled))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (unitType == null) {
			if (other.unitType != null)
				return false;
		} else if (!unitType.equals(other.unitType))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", categoryName=" + categoryName + ", controlled=" + controlled + ", unitType="
				+ unitType + "]";
	}


}
