package com.airportmgmt.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.airportmgmt.dtos.ManagerDto;
import com.airportmgmt.models.User;
import com.airportmgmt.services.UserService;

@Controller
public class HomeController {
	
	@Autowired private UserService userService;
	@Autowired private HttpSession session;

	@GetMapping("/")
	public String homepage() {
		return  "index";
	}
	
	@PostMapping("/")
	public String Validate(String userid,String pwd, String role,RedirectAttributes redirAttrs) {
		User user=userService.validate(userid, pwd, role);
		System.out.println(user);
		if(user==null) {
			redirAttrs.addFlashAttribute("error", "Invalid username or password..!!");
			return "redirect:/";
		}else {
			session.setAttribute("userid", user.getUserid());
			session.setAttribute("uname", user.getUname());
			session.setAttribute("role", role);
			if(role.equals("Admin")) {
				return "redirect:/dashboard";
			}else {
				return "redirect:/hangerstatus";	
			}
		}
	}
	
	@GetMapping("/register")
	public String registerpage() {
		return  "register";
	}
	
	@PostMapping("/register")
	public String registerprocess(ManagerDto dto,RedirectAttributes ra) {
		if(userService.checkEmailExists(dto.getEmail()) || userService.checkSSNExists(dto.getSsn())){
			ra.addFlashAttribute("error", "Duplicate SSN or Email exists");
			return "redirect:/register";
		}
		String mgrid = userService.saveManager(dto);
		ra.addFlashAttribute("msg", "Registered successfully with id "+mgrid);
		return "redirect:/register";
	}
	
	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}
}
