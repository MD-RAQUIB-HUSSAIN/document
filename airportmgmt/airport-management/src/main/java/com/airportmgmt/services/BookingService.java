package com.airportmgmt.services;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airportmgmt.dao.BookingDao;
import com.airportmgmt.dtos.StatusSearchDto;
import com.airportmgmt.models.Booking;

@Service
public class BookingService {

	@Autowired private BookingDao bookingDao;
	
	public void saveBooking(Booking booking) {
		booking.setId(generateBookingId());
		bookingDao.save(booking);
	}
	
	public List<Booking> getBookings(){
		return bookingDao.findAll();
	}
	
	public List<StatusSearchDto> getRangeBookings(LocalDate fromdate,LocalDate todate){
		List<StatusSearchDto> list = bookingDao.findBookings(fromdate, todate);		
		return list.stream().filter(x->x.getAvailable()>0).toList();
	}
	
	private String generateBookingId() {
		return String.format("ALT-%03d", bookingDao.count()+1);
	}
}
