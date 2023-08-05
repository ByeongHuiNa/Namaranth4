package org.namaranth.controller;

import java.util.List;

import org.namaranth.domain.CalendarVO;
import org.namaranth.service.CalendarService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/calendar")
@AllArgsConstructor
@Log4j
public class CalendarController {
	
	private CalendarService service;
	
	@GetMapping("/calendar")
	public void calendar(Model model) {
		model.addAttribute("list", service.getList());                          
	}
	
//	@PostMapping("/register")
//	public String register(CalendarVO cal) {
//		service.register(cal);
//		
//		return "redirect:/calendar/calendar";
//	}
	
	@PostMapping("/register")
	public String registerCal(CalendarVO cal, @RequestParam("calParti_no[]") List<Integer> calParti_no) {
		log.info(cal);
		log.info(calParti_no);
	
		service.registerCal(cal, calParti_no);
		
		return "redirect:/calendar/calendar";
	}
	
	
}
