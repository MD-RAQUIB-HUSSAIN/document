package com.airportmgmt.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Plane {

	@Id
	private String plainid;
	private String name;
	private String mfname;
	private String regno;
	private String modelno;
	private int capacity;
	
	@ManyToOne
	@JoinColumn(name = "owner_id")
	private User owner;
	
	public Plane() {}
	
	public Plane(String plainid) {
		this.plainid = plainid;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPlainid() {
		return plainid;
	}

	public void setPlainid(String plainid) {
		this.plainid = plainid;
	}

	public String getMfname() {
		return mfname;
	}

	public void setMfname(String mfname) {
		this.mfname = mfname;
	}

	public String getRegno() {
		return regno;
	}

	public void setRegno(String regno) {
		this.regno = regno;
	}

	public String getModelno() {
		return modelno;
	}

	public void setModelno(String modelno) {
		this.modelno = modelno;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}
	
	
}
