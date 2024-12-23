package com.airportmgmt.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Pilot {

	@Id
	private String id;
	private Long licno;
	@ManyToOne
	@JoinColumn(name = "pilot_id")
	private User pilot;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}	
	public Long getLicno() {
		return licno;
	}
	public void setLicno(Long licno) {
		this.licno = licno;
	}
	public User getPilot() {
		return pilot;
	}
	public void setPilot(User pilot) {
		this.pilot = pilot;
	}
	
	
}
