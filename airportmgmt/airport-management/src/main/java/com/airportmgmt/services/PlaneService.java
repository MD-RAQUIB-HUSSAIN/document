package com.airportmgmt.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airportmgmt.dao.PlaneDao;
import com.airportmgmt.dtos.ManagerDto;
import com.airportmgmt.dtos.PlaneDto;
import com.airportmgmt.models.Plane;
import com.airportmgmt.models.User;

@Service
public class PlaneService {

	@Autowired private PlaneDao planeDao;
	
	@Autowired private UserService userService;
	
	public String savePlane(PlaneDto dto) {
		Plane plane = new Plane();
		plane.setCapacity(dto.getCapacity());
		plane.setMfname(dto.getMfname());
		plane.setRegno(dto.getRegno());
		plane.setModelno(dto.getModelno());
		plane.setName(dto.getName());
		String planeid = generatePlaneId();
		plane.setPlainid(planeid);
		Optional<User> user = userService.getUserByIdAndRole(dto.getEmail(), "Owner");
		if(user.isEmpty()) {
			ManagerDto mdto = new ManagerDto();
			BeanUtils.copyProperties(dto, mdto);
			userService.saveOwner(mdto);
			user = userService.getUserByIdAndRole(dto.getEmail(), "Owner");
		}	
		plane.setOwner(user.get());
		planeDao.save(plane);
		return planeid;
	}
	
	public List<Plane> getPlanes(){
		return planeDao.findAll();
	}
	
	private String generatePlaneId() {
		return String.format("PLN-%03d", planeDao.count()+1);
	}
	
	
}
