package org.namaranth.controller;

import java.security.Principal;

import org.namaranth.domain.EmailVO;
import org.namaranth.domain.UsersVO;
import org.namaranth.service.EmailService;
import org.namaranth.service.UserService;
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
	
	private UserService userService;
	

	
	
	@GetMapping("/allmail")
	public void allmail(Principal principal, Model model) {
		String user_email = principal.getName(); 
		UsersVO VO = userService.getUser(user_email);
	    model.addAttribute("user", VO);
	    String deptName = userService.getDept(user_email);
	    model.addAttribute("dept", deptName);
	      
		log.info("allmail");
		model.addAttribute("sendmail", service.getSendList(VO.getUser_no()));
		model.addAttribute("receivemail", service.getReceiveList(VO.getUser_no()));
		log.info("������ȣ @@@@@@@@@@@: " +  VO.getUser_no());
		log.info(model);
	}
	
	@GetMapping("/sendmail")
	public void sendmail(Principal principal, Model model) {
		String user_email = principal.getName(); 
		UsersVO VO = userService.getUser(user_email);
	    model.addAttribute("user", VO);
	    String deptName = userService.getDept(user_email);
	    model.addAttribute("dept", deptName);
	      
		log.info("allmail");
		model.addAttribute("allmail", service.getSendList(VO.getUser_no()));
		//model.addAttribute("getreceiver", service.getReceiver(2)); //���Ϲ�ȣ
		log.info("������ȣ @@@@@@@@@@@: " +  VO.getUser_no());
		
		log.info(model);
	}
	
	@GetMapping("/receivemail")
	public void receivemail(Principal principal, Model model) {
		String user_email = principal.getName(); 
		UsersVO VO = userService.getUser(user_email);
	    model.addAttribute("user", VO);
	    String deptName = userService.getDept(user_email);
	    model.addAttribute("dept", deptName);
	      
		log.info("allmail");
		model.addAttribute("allmail", service.getReceiveList(VO.getUser_no()));
		log.info("������ȣ @@@@@@@@@@@: " +  VO.getUser_no());
		log.info(model);
	}
	
	@GetMapping("/tsmail")
	public void tsmail(Principal principal, Model model) {
		String user_email = principal.getName(); 
		UsersVO VO = userService.getUser(user_email);
	    model.addAttribute("user", VO);
	    String deptName = userService.getDept(user_email);
	    model.addAttribute("dept", deptName);
	      
		log.info("allmail");
		model.addAttribute("allmail", service.getSendList(VO.getUser_no()));
		//model.addAttribute("getreceiver", service.getReceiver(2)); //���Ϲ�ȣ
		log.info("������ȣ @@@@@@@@@@@: " +  VO.getUser_no());
		
		log.info(model);
	}
	
	
	@GetMapping("/getmail")
	public void getmail(@RequestParam("mail_no") int mail_no, Model model, Principal principal) {
		String user_email = principal.getName(); 
		UsersVO VO = userService.getUser(user_email);
	    model.addAttribute("user", VO);
	    String deptName = userService.getDept(user_email);
	    model.addAttribute("dept", deptName);
		
		log.info("/getmail");
		model.addAttribute("getmail", service.get(mail_no));
		model.addAttribute("getreceiver", service.getReceiver(mail_no));
		log.info("/getmail: " + model);
	}
	
	@GetMapping("/register")
	public void register(Model model, Principal principal) {
		String user_email = principal.getName(); 
		UsersVO VO = userService.getUser(user_email);
	    model.addAttribute("user", VO);
	    String deptName = userService.getDept(user_email);
	    model.addAttribute("dept", deptName);
	    //model.addAttribute("user_no", VO.getUser_no());
		
	}
	
	@PostMapping("/register")
	public String registermail(EmailVO email, RedirectAttributes rttr, int receiver_no) {
		
		log.info("register : " + email);
		service.register(email);
		service.registerUser(receiver_no);
		return "redirect:/email/allmail";
	}
	
	@PostMapping("/tsregister")
	public String tsregistermail(EmailVO email, RedirectAttributes rttr) {
		
		log.info("tsregister : " + email);
		service.tsregister(email);
		
		return "redirect:/email/allmail";
	}
	
	
	
	
	
	
}
