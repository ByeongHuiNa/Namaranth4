package org.namaranth.controller;

import org.namaranth.service.CalendarService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/calendar")
@AllArgsConstructor
public class CalendarController {
	
	private CalendarService service;
	
	@GetMapping("/calendar")
	public void calendar(Model model) {
		model.addAttribute("list", service.getList());
	}
	
	
}
