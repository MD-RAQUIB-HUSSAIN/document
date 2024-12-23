package com.airportmgmt.dao;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.airportmgmt.models.Hanger;

@Repository
public interface HangerDao extends JpaRepository<Hanger, String> {

	@Query(value = "SELECT * from hanger h where h.capacity>(select count(*) from booking b where h.id=b.hanger_id and (fromdate>=?1 and fromdate<=?2) or (todate>=?1 and todate<=?2))", nativeQuery = true)
	List<Hanger> findAvailableHangers(LocalDate fromdate,LocalDate todate);
}
