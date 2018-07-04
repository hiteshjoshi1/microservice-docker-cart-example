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

import com.fasterxml.jackson.annotation.JsonManagedReference;

/**
 * @author hitjoshi
 *
 */
@Entity
@Table(name = "TERTIARY_PROD_CATEGORY")
public class TertiaryCategory implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID")
	private Long id;
	
	@Column(name="CATEGORY_NAME")
	private String categoryName;
	
	@ManyToOne(cascade= CascadeType.ALL, fetch= FetchType.EAGER) 
	@JsonManagedReference
	private SecondaryCategory secondaryCategory;

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

	public SecondaryCategory getSecondaryCategory() {
		return secondaryCategory;
	}

	public void setSecondaryCategory(SecondaryCategory secondaryCategory) {
		this.secondaryCategory = secondaryCategory;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((categoryName == null) ? 0 : categoryName.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((secondaryCategory == null) ? 0 : secondaryCategory.hashCode());
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
		TertiaryCategory other = (TertiaryCategory) obj;
		if (categoryName == null) {
			if (other.categoryName != null)
				return false;
		} else if (!categoryName.equals(other.categoryName))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (secondaryCategory == null) {
			if (other.secondaryCategory != null)
				return false;
		} else if (!secondaryCategory.equals(other.secondaryCategory))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "TertiaryCategory [id=" + id + ", categoryName=" + categoryName + ", secondaryCategory="
				+ secondaryCategory + "]";
	}

}
