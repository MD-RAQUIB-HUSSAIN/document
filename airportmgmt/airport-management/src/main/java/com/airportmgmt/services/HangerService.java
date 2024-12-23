package com.airportmgmt.services;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airportmgmt.dao.HangerDao;
import com.airportmgmt.dtos.HangerDto;
import com.airportmgmt.dtos.ManagerDto;
import com.airportmgmt.models.Hanger;
import com.airportmgmt.models.User;

@Service
public class HangerService {
	@Autowired private HangerDao hangerDao;
	
	@Autowired private UserService userService;
	
	public String saveHanger(HangerDto dto) {
		Hanger hanger = new Hanger();
		Optional<User> user = userService.getUserByIdAndRole(dto.getEmail(), "Manager");
		if(user.isPresent()) {
			hanger.setManager(user.get());
		}else {
			ManagerDto mdto = new ManagerDto();
			BeanUtils.copyProperties(dto, mdto);
			userService.saveManager(mdto);
			User manager = userService.getUserByIdAndRole(dto.getEmail(), "Manager").get();
			hanger.setManager(manager);
		}
		String hangerid = generateHangerId(dto.getLocation());
		hanger.setCapacity(dto.getCapacity());
		hanger.setLocation(dto.getLocation());
		hanger.setId(hangerid);
		hangerDao.save(hanger);
		return hangerid;
	}
	
	public List<Hanger> getHangers(){
		return hangerDao.findAll();
	}
	
	public List<Hanger> getAvailableHangers(LocalDate from,LocalDate to){
		return hangerDao.findAvailableHangers(from,to);
	}
	
	private String generateHangerId(String location) {
		String last4digits = location.substring(0,3);
		return String.format("%s-%d",last4digits, hangerDao.count()+ 101);
	}
}
