package com.hitesh.microservices.invoice.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


	
	@Entity
	@Table(name = "mode_of_pay")
	public class ModeOfPay implements Serializable {

		/**
		 * 
		 */
		private static final long serialVersionUID = 5767683272497337030L;
		
		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		@Column(name="ID")
		private Long id;	
	
		@Column(name="MODE_NAME")
		private String modeName;
		
		@Column(name="MODE_DESC")
		private String modeDesc;

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getModeName() {
			return modeName;
		}

		public void setModeName(String modeName) {
			this.modeName = modeName;
		}

		public String getModeDesc() {
			return modeDesc;
		}

		public void setModeDesc(String modeDesc) {
			this.modeDesc = modeDesc;
		}

		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ((id == null) ? 0 : id.hashCode());
			result = prime * result + ((modeDesc == null) ? 0 : modeDesc.hashCode());
			result = prime * result + ((modeName == null) ? 0 : modeName.hashCode());
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
			ModeOfPay other = (ModeOfPay) obj;
			if (id == null) {
				if (other.id != null)
					return false;
			} else if (!id.equals(other.id))
				return false;
			if (modeDesc == null) {
				if (other.modeDesc != null)
					return false;
			} else if (!modeDesc.equals(other.modeDesc))
				return false;
			if (modeName == null) {
				if (other.modeName != null)
					return false;
			} else if (!modeName.equals(other.modeName))
				return false;
			return true;
		}

		@Override
		public String toString() {
			return "PaymentMode [id=" + id + ", modeName=" + modeName + ", modeDesc=" + modeDesc + "]";
		}	

}
