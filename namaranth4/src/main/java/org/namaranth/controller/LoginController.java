package org.namaranth.controller;

import java.security.Principal;

import org.namaranth.domain.UsersVO;
import org.namaranth.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class LoginController {
	
	private UserService service;
	
	// 로그인 페이지
	@GetMapping("/login")
	public void login() {
		log.info("로그인 페이지");
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public void logout() {
		log.info("로그아웃");
	}
	
	// 메인페이지
	@GetMapping("/main")
	public void main(Principal principal, Model model) {
		log.info("메인페이지");
		
		String user_email = principal.getName();
		log.info("유저아이디: "+ user_email);
		
		UsersVO VO = service.getUser(user_email);
		model.addAttribute("user", VO);
		
		String deptName = service.getDept(user_email);
		model.addAttribute("dept", deptName);
	}
	
}
