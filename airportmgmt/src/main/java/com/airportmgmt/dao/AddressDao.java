package com.airportmgmt.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.airportmgmt.models.Address;

@Repository
public interface AddressDao extends  JpaRepository<Address, String> {
	
	@Query(value = "SELECT count(*) from address where city like '?1%'", nativeQuery = true)
	Long findCityCount(String city);
}
