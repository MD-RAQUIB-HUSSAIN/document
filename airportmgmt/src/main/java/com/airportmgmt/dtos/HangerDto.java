package com.airportmgmt.dtos;

public class HangerDto extends ManagerDto {
	private String location;
	private int capacity;
	
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	
	
}
