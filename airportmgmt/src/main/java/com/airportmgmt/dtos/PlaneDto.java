package com.airportmgmt.dtos;

public class PlaneDto extends ManagerDto {
	private String name;
	private String mfname;
	private String regno;
	private String modelno;
	private int capacity;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
	
}
