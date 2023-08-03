package org.namaranth.controller;

import org.namaranth.domain.EmailVO;
import org.namaranth.service.EmailService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/email/*")
public class EmailController {
	
	private EmailService service;

	@GetMapping("/r1")
	public void r1() {
		
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
		model.addAttribute("getreceiver", service.getReceiver(mail_no));
		log.info("/getmail: " + model);
	}
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String registermail(EmailVO email, RedirectAttributes rttr) {
		log.info("register : " + email);
		service.register(email);
		return "redirect:/email/allmail";
	}
	
	
}
