package com.airportmgmt.dao;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.airportmgmt.dtos.StatusSearchDto;
import com.airportmgmt.models.Booking;

@Repository
public interface BookingDao extends JpaRepository<Booking, String> {
	@Query(value = "SELECT id,capacity,location,h.capacity-(select count(*) from booking b where h.id=b.hanger_id and ((b.fromdate>=?1 and b.fromdate<=?2) or (b.todate>=?1 and b.todate<=?2))) As available from hanger h", nativeQuery = true)
	List<StatusSearchDto> findBookings(LocalDate fromdate,LocalDate todate);
}
