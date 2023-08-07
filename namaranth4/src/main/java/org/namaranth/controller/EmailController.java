package org.namaranth.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.namaranth.domain.EmailVO;
import org.namaranth.domain.EmailtsVO;
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
	

	
	//전체메일함
	@GetMapping("/allmail")
	public void allmail(Principal principal, Model model) {
		String user_email = principal.getName(); 
		UsersVO VO = userService.getUser(user_email);
	    model.addAttribute("user", VO);
	    String deptName = userService.getDept(user_email);
	    model.addAttribute("dept", deptName);
	      
		log.info("allmail");
		 	List<EmailVO> sendMailList = service.getSendList(VO.getUser_no());
		    List<EmailVO> receiveMailList = service.getReceiveList(VO.getUser_no());
		    List<EmailVO> allMailList = new ArrayList<>();
		    allMailList.addAll(sendMailList);
		    allMailList.addAll(receiveMailList);
		    Collections.sort(allMailList, new SortAll());
		    model.addAttribute("allmail", allMailList);
		
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
		
		log.info(model);
	}
	
	@GetMapping("/delmail")
	public void delmail(Principal principal, Model model) {
		String user_email = principal.getName(); 
		UsersVO VO = userService.getUser(user_email);
	    model.addAttribute("user", VO);
	    String deptName = userService.getDept(user_email);
	    model.addAttribute("dept", deptName);
	      
	    log.info("delmail");
		model.addAttribute("delmail", service.getDelList(VO.getUser_no()));
		
		log.info(model);
	}
	
	
	
	@GetMapping("/tsmail")
	public void tsmail(Principal principal, Model model) {
		String user_email = principal.getName(); 
		UsersVO VO = userService.getUser(user_email);
	    model.addAttribute("user", VO);
	    String deptName = userService.getDept(user_email);
	    model.addAttribute("dept", deptName);
	      
		model.addAttribute("tsmail", service.getTsList(VO.getUser_no()));
		
		
		log.info(model);
	}
	
	//메일조회
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
	
	//임시보관함 메일 조회
	@GetMapping("/gettsmail")
	public void gettsmail(@RequestParam("mailts_no") int mailts_no, Model model, Principal principal) {
		String user_email = principal.getName(); 
		UsersVO VO = userService.getUser(user_email);
	    model.addAttribute("user", VO);
	    String deptName = userService.getDept(user_email);
	    model.addAttribute("dept", deptName);
		
		log.info("/gettsmail");
		model.addAttribute("gettsmail", service.getts(mailts_no));
		//model.addAttribute("getreceiver", service.getReceiver(mailts_no));
		log.info("/getstmail: " + model);
	}
	
	//휴지통메일조회
		@GetMapping("/getdelmail")
		public void getdelmail(@RequestParam("mail_no") int mail_no, Model model, Principal principal) {
			String user_email = principal.getName(); 
			UsersVO VO = userService.getUser(user_email);
		    model.addAttribute("user", VO);
		    String deptName = userService.getDept(user_email);
		    model.addAttribute("dept", deptName);
			
			log.info("/getdelmail");
			model.addAttribute("getdelmail", service.get(mail_no));
			model.addAttribute("getreceiver", service.getReceiver(mail_no));
			log.info("/getdelmail: " + model);
		}
	
	@GetMapping("/register") //메일전송페이지
	public void register(Model model, Principal principal) {
		String user_email = principal.getName(); 
		UsersVO VO = userService.getUser(user_email);
	    model.addAttribute("user", VO);
	    String deptName = userService.getDept(user_email);
	    model.addAttribute("dept", deptName);
	    //model.addAttribute("user_no", VO.getUser_no());
		
	}
	
	@PostMapping("/register") //메일전송
	public String registermail(EmailVO email, RedirectAttributes rttr, int receiver_no, HttpServletRequest request) {
		
		log.info("register : " + email);
		try {
			Integer mailts_no = Integer.parseInt(request.getParameter("mailts_no"));
		log.info("mailts_no: " +   mailts_no);
			if(mailts_no != null) {
				service.tsremove(mailts_no);
			
		}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		service.register(email);
		service.registerUser(receiver_no);
		return "redirect:/email/allmail";
	}
	
	@PostMapping("/tsregister") //메일 임시저장
	public String tsregistermail(EmailVO email, RedirectAttributes rttr, HttpServletRequest request) {
		
		log.info("tsregister : " + email);
		
		service.tsregister(email);
		
		return "redirect:/email/tsmail";
	}
	
	@PostMapping("/maildel") //메일 휴지통으로 보내기
	public String maildel(EmailVO email, RedirectAttributes rttr) {
		
		log.info("maildel : " + email);
		
		service.emailDel(email);
		
		return "redirect:/email/delmail";
	}
	
	@PostMapping("/mailrestore") //휴지통 메일 복구
	public String mailrestore(@RequestParam("mail_no") int mail_no, RedirectAttributes rttr) {
		
		log.info("mailrestore : " + mail_no);
		
		if(service.restore(mail_no)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/email/delmail";
	}
	
	
	
	
	
	
	
	
}




	class SortAll implements Comparator<EmailVO> {

		@Override
		public int compare(EmailVO o1, EmailVO o2) {
			
			if(o1.getMail_no()>o2.getMail_no() ) {
				return -1;
			}else if(o1.getMail_no()<o2.getMail_no()) {
				return 1;
			}else
				return 0;
			
		}
		
		
	}

