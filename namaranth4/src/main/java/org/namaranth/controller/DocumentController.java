package org.namaranth.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.namaranth.domain.DocumentVO;
import org.namaranth.service.DocumentService;
import org.namaranth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/document/*")
public class DocumentController {

	@Autowired
	private DocumentService service;
	
	@Autowired
	private UserService userService;
	
//	@GetMapping("/docboard")
//	public void docboard(Model model) {
//		model.addAttribute("list",service.getList());
//	}
	
	//기안문서함
	@GetMapping("/docboard")
	public void docboard(Principal principal, Model model) {
		
		model.addAttribute("list",service.getDocList(principal.getName()));
	}
	
	//결재요청함
	@GetMapping("/docappReq")
	public void docappReq(Principal principal, Model model) {
		
		model.addAttribute("list",service.getDocAppReqList(principal.getName()));
	}
	
	//반려문서함
	@GetMapping("/docappRej")
	public void docappRejBoard(Principal principal, Model model) {
		model.addAttribute("list", service.getDocAppRejList(principal.getName()));
	}
	
	@GetMapping("/docappComp")
	public void docappComplBoard(Principal principal, Model model) {
		model.addAttribute("list", service.getDocAppComplList(principal.getName()));
	}
	
	
	//문서조회
	@GetMapping("/docshow")
	public void showdoc(@RequestParam("doc_no") int doc_no, Model model) {
		log.info(doc_no);
		model.addAttribute("get", service.showDoc(doc_no));
	}
	
	@GetMapping("/docregi")
	public void docregi(Principal principal, Model model) {
		String email = principal.getName();
		model.addAttribute("login", userService.getUser(email)); 
	}
	
	@PostMapping("/docregi")
	public String docregister(@ModelAttribute DocumentVO vo, HttpServletRequest request) {
		log.info("resi....");
		
		int firstAppNo = Integer.parseInt(request.getParameter("first_app"));
		int secondAppNo = Integer.parseInt(request.getParameter("second_app"));
		service.getRegi(vo, firstAppNo, secondAppNo);
		return "redirect:/document/docboard";
	}
	
	@PostMapping("/docApp")
	public String docApp(Principal principal, HttpServletRequest request) {
		
		int doc_no = Integer.parseInt(request.getParameter("doc_no"));
		String email = principal.getName();
		service.docApp(doc_no, email);
		return "redirect:/document/docappReq";
	}
	
	@PostMapping("/docRej")
	public String docRej(Principal principal, HttpServletRequest request) {
		int doc_no = Integer.parseInt(request.getParameter("doc_no"));
		String rej_content = request.getParameter("docrej_content");
		String email = principal.getName();
		service.docRej(doc_no, email, rej_content);
		
		return "redirect:/document/docappReq";
	}
	
	
}
