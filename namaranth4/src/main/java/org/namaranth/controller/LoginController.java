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
	
	// �α��� ������
	@GetMapping("/login")
	public void login() {
		log.info("�α��� ������");
	}
	
	// �α׾ƿ�
	@GetMapping("/logout")
	public void logout() {
		log.info("�α׾ƿ�");
	}
	
	// ����������
	@GetMapping("/main")
	public void main(Principal principal, Model model) {
		log.info("����������");
		
		String user_email = principal.getName();
		log.info("�������̵�: "+ user_email);
		
		UsersVO VO = service.getUser(user_email);
		model.addAttribute("user", VO);
		
		String deptName = service.getDept(user_email);
		model.addAttribute("dept", deptName);
	}
	
}
