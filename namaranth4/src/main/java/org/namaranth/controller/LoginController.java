package org.namaranth.controller;

import java.security.Principal;
import java.util.List;

import org.namaranth.domain.DocumentVO;
import org.namaranth.domain.EmailVO;
import org.namaranth.domain.NoteVO;
import org.namaranth.domain.NoticeVO;
import org.namaranth.domain.UsersVO;
import org.namaranth.service.NoteService;
import org.namaranth.service.NoticeService;
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
	
	private UserService userService;
	private NoticeService noticeService;
	private NoteService noteService;
	
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
		
		UsersVO users = userService.getUser(user_email);
		model.addAttribute("user", users);
		
		String deptName = userService.getDept(user_email);
		model.addAttribute("dept", deptName);
		
		int user_no = users.getUser_no();
		List<EmailVO> emails = userService.getEmails(user_no);
		model.addAttribute("emails", emails);
		
		List<DocumentVO> docs = userService.getDoc(user_no);
		model.addAttribute("docs", docs);
		
		List<NoticeVO> notices = noticeService.getNoticeList();
		model.addAttribute("notices", notices);
		
		List<NoteVO> notes = noteService.getList(user_no);
		model.addAttribute("notes", notes);
	}
	
	// ȸ�� ���� ����
	@GetMapping("/userUpdate")
	public void userUpdate() {
		log.info("ȸ������ ����");
	}
}
