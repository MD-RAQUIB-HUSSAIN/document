package com.airportmgmt.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.airportmgmt.models.Plane;

@Repository
public interface PlaneDao extends JpaRepository<Plane, String>{

}
