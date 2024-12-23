package com.airportmgmt.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airportmgmt.dao.AddressDao;
import com.airportmgmt.dao.UserDao;
import com.airportmgmt.dtos.ManagerDto;
import com.airportmgmt.models.Address;
import com.airportmgmt.models.User;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired private AddressDao addressDao;
	
	public User validate(String userid,String pwd,String role) {
		Optional<User> user = userDao.findByUseridAndRole(userid, role);
		if(user.isPresent() && user.get().getPwd().equals(pwd)) {
			return user.get();
		}
		return null;			
	}
	
	public Optional<User> getUserByIdAndRole(String userid, String role) {
		return userDao.findByUseridAndRole(userid, role);
	}
	
	public boolean checkEmailExists(String email) {
		return userDao.findByUseridAndRole(email, "Manager").isPresent();
	}
	
	public boolean checkSSNExists(String ssn) {
		return userDao.findBySsn(ssn).isPresent();
	}
	
	public String saveManager(ManagerDto dto) {
		Address address = new Address();
		BeanUtils.copyProperties(dto, address);
		address.setId(generateAddressId(address));
		addressDao.save(address);
		User user = new User();
		BeanUtils.copyProperties(dto, user);
		user.setRole("Manager");
		String mgrid = generateManagerId(dto.getSsn());
		user.setManagerid(mgrid);
		user.setUserid(dto.getEmail());
		user.setAddress(address);
		userDao.save(user);
		return mgrid;
	}
	
	public void saveOwner(ManagerDto dto) {
		Address address = new Address();
		BeanUtils.copyProperties(dto, address);
		address.setId(generateAddressId(address));
		addressDao.save(address);
		User user = new User();
		BeanUtils.copyProperties(dto, user);
		user.setRole("Owner");
		user.setUserid(dto.getEmail());		
		user.setAddress(address);
		userDao.save(user);
	}
	
	public void savePilot(ManagerDto dto) {
		Address address = new Address();
		BeanUtils.copyProperties(dto, address);
		address.setId(generateAddressId(address));
		addressDao.save(address);
		User user = new User();
		BeanUtils.copyProperties(dto, user);
		user.setRole("Pilot");
		user.setUserid(dto.getEmail());
		user.setAddress(address);
		userDao.save(user);
	}
	
	public List<User> getManagers(){
		return userDao.findByRole("Manager");
	}
	
	private String generateAddressId(Address address) {
		String startcity = address.getCity().substring(0, 3);
		//long count = addressDao.findCityCount(startcity);
		return String.format("%s-%03d",startcity,101+ addressDao.count()); 
	}
	
	private String generateManagerId(String ssn) {
		String last4digits = ssn.substring(ssn.length()-5, ssn.length()-1);
		return String.format("%s-%d",last4digits, userDao.count()+ 31);
	}
	
	public void createAdmin() {
		if(userDao.count()==0) {
			User user = new User();
			user.setRole("Admin");
			user.setUserid("admin");
			user.setPwd("admin");
			user.setUname("Administrator");
			userDao.save(user);
		}
	}

}
