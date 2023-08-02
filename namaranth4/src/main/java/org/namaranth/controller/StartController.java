package org.namaranth.controller;

import org.namaranth.service.EmailService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class StartController {
	
	private EmailService service;

	@GetMapping("/main")
	public void main() {
		
	}
	
	@GetMapping("/allmail")
	public void allmail(Model model) {
		log.info("allmail");
		model.addAttribute("allmail", service.getList());
		log.info(model);
	}
	
	@GetMapping("/getmail")
	public void getmail(@RequestParam("mail_no") int mail_no, Model model) {
		log.info("/getmail");
		model.addAttribute("getmail", service.get(mail_no));
		log.info(model);
	}
}
