package com.airportmgmt.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.airportmgmt.models.User;

@Repository
public interface UserDao extends JpaRepository<User, String> {

	Optional<User> findByUseridAndRole(String userid,String role);
	List<User> findByRole(String role);
	Optional<User> findBySsn(String ssn);
}
