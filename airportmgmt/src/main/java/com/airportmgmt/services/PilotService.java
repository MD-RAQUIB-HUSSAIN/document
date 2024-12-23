package com.airportmgmt.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airportmgmt.dao.PilotDao;
import com.airportmgmt.dtos.ManagerDto;
import com.airportmgmt.dtos.PilotDto;
import com.airportmgmt.models.Pilot;
import com.airportmgmt.models.User;

@Service
public class PilotService {

	@Autowired private PilotDao pilotDao;
	
	@Autowired private UserService userService;
	
	public String savePilot(PilotDto dto) {
		Optional<User> user = userService.getUserByIdAndRole(dto.getEmail(), "Pilot");
		if(user.isEmpty() && (checkLicenseExists(dto.getLicno()) || checkSSNExists(dto.getSsn()))) {
			return "error";
		}
		ManagerDto mdto = new ManagerDto();
		BeanUtils.copyProperties(dto, mdto);
		userService.savePilot(mdto);
		user = userService.getUserByIdAndRole(dto.getEmail(), "Pilot");
		Pilot pilot = new Pilot();
		pilot.setLicno(dto.getLicno());
		String pilotid=generatePilotId(dto.getSsn());
		pilot.setId(pilotid);
		pilot.setPilot(user.get());
		pilotDao.save(pilot);
		return pilotid;
	}
	
	public boolean checkLicenseExists(Long licno) {
		return pilotDao.findByLicno(licno).isPresent();
	}
	
	public boolean checkSSNExists(String ssn) {
		return pilotDao.findByPilotSsn(ssn).isPresent();
	}
	
	public List<Pilot> getPilots(){
		return pilotDao.findAll();
	}
	
	private String generatePilotId(String ssn) {
		String last4digits = ssn.substring(ssn.length()-5, ssn.length()-1);
		return String.format("%s-%d",last4digits, pilotDao.count()+ 31);
	}
}
