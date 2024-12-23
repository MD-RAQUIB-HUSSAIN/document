package com.airportmgmt.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.airportmgmt.models.Pilot;

@Repository
public interface PilotDao extends JpaRepository<Pilot, String> {
	Optional<Pilot> findByLicno(Long licno);
	Optional<Pilot> findByPilotSsn(String ssn);
}
