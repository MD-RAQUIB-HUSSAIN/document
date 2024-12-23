package com.airportmgmt.models;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Booking {

	@Id
	private String id;
	private LocalDate fromdate;
	private LocalDate todate;
	
	@ManyToOne
	@JoinColumn(name = "hanger_id")
	private Hanger hanger;

	@ManyToOne
	@JoinColumn(name = "plane_id")
	private Plane plane;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public LocalDate getFromdate() {
		return fromdate;
	}

	public void setFromdate(LocalDate fromdate) {
		this.fromdate = fromdate;
	}

	public LocalDate getTodate() {
		return todate;
	}

	public void setTodate(LocalDate todate) {
		this.todate = todate;
	}

	public Hanger getHanger() {
		return hanger;
	}

	public void setHanger(Hanger hanger) {
		this.hanger = hanger;
	}

	public Plane getPlane() {
		return plane;
	}

	public void setPlane(Plane plane) {
		this.plane = plane;
	}
	
	
	
}
