package com.airportmgmt.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.airportmgmt.dtos.HangerDto;
import com.airportmgmt.dtos.PilotDto;
import com.airportmgmt.dtos.PlaneDto;
import com.airportmgmt.models.Booking;
import com.airportmgmt.models.Hanger;
import com.airportmgmt.models.User;
import com.airportmgmt.services.BookingService;
import com.airportmgmt.services.HangerService;
import com.airportmgmt.services.PilotService;
import com.airportmgmt.services.PlaneService;
import com.airportmgmt.services.UserService;

@Controller
public class AdminController {
	
	@Autowired private UserService userService;
	@Autowired private PlaneService planeService;
	@Autowired private PilotService pilotService;
	@Autowired private HangerService hangerService;
	@Autowired private BookingService bookingService;
 	
	
	@GetMapping("/dashboard")
	public String dashboard() {
		return "dashboard";
	}
	
	@GetMapping("/managers")
	public String managers(Model model) {
		model.addAttribute("list", userService.getManagers());
		return "managers";
	}
	
	@GetMapping("/planes")
	public String planes(Model model) {
		model.addAttribute("list", planeService.getPlanes());
		return "planes";
	}
	
	@GetMapping("/pilots")
	public String pilots(Model model) {
		model.addAttribute("list", pilotService.getPilots());				
		return "pilots";
	}
	
	@GetMapping("/hangers")
	public String hangers(Model model) {
		model.addAttribute("list", hangerService.getHangers());
		return "hangers";
	}
	
	@GetMapping("/hangerstatus")
	public String hangerStatus(Booking dto, Model model) {
		if(dto.getFromdate()!=null) {
			model.addAttribute("list", bookingService.getRangeBookings(dto.getFromdate(), dto.getTodate()));
		}
		return "hangerstatus";
	}
	
	@GetMapping("/allotment")
	public String bookings(Model model) {
		model.addAttribute("list", bookingService.getBookings());
		return "bookings";
	}
	
	@GetMapping("/newallotment")
	public String newbookings(Model model,Booking dto) {
		if(dto.getFromdate()!=null) {
			List<Hanger> availables = hangerService.getAvailableHangers(dto.getFromdate(),dto.getTodate());
			model.addAttribute("plist", planeService.getPlanes());
			model.addAttribute("hlist", availables);
			model.addAttribute("hfound", availables.size()>0);
			model.addAttribute("no", availables.size()==0);
		}
		return "newbooking";
	}
	
	@PostMapping("/newallotment")
	public String saveAllotment(Booking dto,RedirectAttributes ra) {
		bookingService.saveBooking(dto);
		ra.addFlashAttribute("msg", "Hanger allocated for plane with id "+ dto.getPlane().getPlainid()+" for date "+dto.getFromdate() +" to "+dto.getTodate());
		return "redirect:/allotment";
	}
	
	@GetMapping("/newplane")
	public String newplane(Model model) {
		return "newplane";
	}
	
	@PostMapping("/newplane")
	public String savePlane(PlaneDto dto,RedirectAttributes ra) {
		String planeid = planeService.savePlane(dto);
		ra.addFlashAttribute("msg", "Plane added successfully with id "+ planeid);
		return "redirect:/planes";
	}
	
	@GetMapping("/newpilot")
	public String newpilot(Model model) {
		return "newpilot";
	}
	
	@PostMapping("/newpilot")
	public String savePilot(PilotDto dto,RedirectAttributes ra) {		
		String planeid = pilotService.savePilot(dto);
		if(planeid.equals("error")) {
			ra.addFlashAttribute("error", "Duplicate SSN or License no");
			return "redirect:/newpilot";
		}
		ra.addFlashAttribute("msg", "Pilot added successfully with id "+ planeid);
		return "redirect:/pilots";
	}
	
	@GetMapping("/newhanger")
	public String newhanger(Model model) {
		return "newhanger";
	}
	
	@PostMapping("/newhanger")
	public String saveHanger(HangerDto dto,RedirectAttributes ra) {
		String planeid = hangerService.saveHanger(dto);
		ra.addFlashAttribute("msg", "Hanger added successfully with id "+ planeid);
		return "redirect:/hangers";
	}
	
	@GetMapping("/finduser/{id}")
	@ResponseBody
	public User findUserById(@PathVariable("id") String id,String role) {
		return userService.getUserByIdAndRole(id, role).orElse(null);
	}
	
}
