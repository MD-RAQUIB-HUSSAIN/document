package com.airportmgmt;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.airportmgmt.services.UserService;

@SpringBootApplication
public class AirportmgmtApplication {

	public static void main(String[] args) {
		SpringApplication.run(AirportmgmtApplication.class, args);
	}
	
	@Bean
	public CommandLineRunner demo(UserService srv) {
	    return (args) -> {
    		srv.createAdmin();
	    };
	}

}
