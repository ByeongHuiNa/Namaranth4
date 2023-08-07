package org.namaranth.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.namaranth.domain.Criteria;
import org.namaranth.domain.DocumentVO;
import org.namaranth.domain.PageDTO;
import org.namaranth.domain.UsersVO;
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
	public void docboard(Principal principal, Model model, Criteria cri) {
		String user_email = principal.getName();
		UsersVO VO = userService.getUser(user_email);
		model.addAttribute("user", VO);
		String deptName = userService.getDept(user_email);
		model.addAttribute("dept", deptName);
		
		int total = service.getDocTotal(principal.getName());
		//model.addAttribute("list",service.getDocList(principal.getName(), cri));
		model.addAttribute("list",service.getCriDocList(principal.getName(), cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	//결재요청함
	@GetMapping("/docappReq")
	public void docappReq(Principal principal, Model model) {
		String user_email = principal.getName();
		UsersVO VO = userService.getUser(user_email);
		model.addAttribute("user", VO);
		String deptName = userService.getDept(user_email);
		model.addAttribute("dept", deptName);
		model.addAttribute("list",service.getDocAppReqList(principal.getName()));
	}
	
	//반려문서함
	@GetMapping("/docappRej")
	public void docappRejBoard(Principal principal, Model model) {
		String user_email = principal.getName();
		UsersVO VO = userService.getUser(user_email);
		model.addAttribute("user", VO);
		String deptName = userService.getDept(user_email);
		model.addAttribute("dept", deptName);
		model.addAttribute("list", service.getDocAppRejList(principal.getName()));
	}
	
	//결재완료문서함
	@GetMapping("/docappComp")
	public void docappComplBoard(Principal principal, Model model) {
		String user_email = principal.getName();
		UsersVO VO = userService.getUser(user_email);
		model.addAttribute("user", VO);
		String deptName = userService.getDept(user_email);
		model.addAttribute("dept", deptName);
		model.addAttribute("list", service.getDocAppComplList(principal.getName()));
	}
	
	//참조문서함
	@GetMapping("/docRefBoard")
	public void docRefBoard(Principal principal, Model model) {
		String user_email = principal.getName();
		UsersVO VO = userService.getUser(user_email);
		model.addAttribute("user", VO);
		String deptName = userService.getDept(user_email);
		model.addAttribute("dept", deptName);
		model.addAttribute("list", service.getRefDocList(principal.getName()));
	}
	
	
	//문서조회
	@GetMapping("/docshow")
	public void showdoc(@RequestParam("doc_no") int doc_no, Model model, Principal principal) {
		String email = principal.getName();
		model.addAttribute("login", userService.getUser(email)); 
		
		String user_email = principal.getName();
		UsersVO VO = userService.getUser(user_email);
		model.addAttribute("user", VO);
		String deptName = userService.getDept(user_email);
		model.addAttribute("dept", deptName);
		
		log.info(doc_no);
		UsersVO fvo = service.getFirstAppUser(doc_no);
		UsersVO svo = service.getSecondAppUser(doc_no);
		model.addAttribute("get", service.showDoc(doc_no));
		model.addAttribute("first_app", fvo);
		model.addAttribute("second_app", svo);
		model.addAttribute("first_app_check", service.checkApp(doc_no, fvo.getUser_no()));
		log.info(service.checkApp(doc_no, fvo.getUser_no()));
		model.addAttribute("second_app_check", service.checkApp(doc_no, svo.getUser_no()));
		model.addAttribute("reflist", service.getRefUserList(doc_no));
		model.addAttribute("rejContent", service.getRejContent(doc_no));
	}
	
	@GetMapping("/docregi")
	public void docregi(Principal principal, Model model) {
		String user_email = principal.getName();
		UsersVO VO = userService.getUser(user_email);
		model.addAttribute("user", VO);
		String deptName = userService.getDept(user_email);
		model.addAttribute("dept", deptName);
		String email = principal.getName();
		model.addAttribute("login", userService.getUser(email)); 
	}
	
	@PostMapping("/docregi")
	public String docregister(@ModelAttribute DocumentVO vo, HttpServletRequest request) {
		log.info("resi....");
		
		List<Integer> appList = new ArrayList<Integer>();
		int firstAppNo = Integer.parseInt(request.getParameter("first_app"));
		int secondAppNo = Integer.parseInt(request.getParameter("second_app"));
		appList.add(firstAppNo);
		appList.add(secondAppNo);
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
	
	@PostMapping("/docRef")
	public String doc_Ref(@RequestParam("doc_no") int doc_no, @RequestParam("refUserList") List<Integer> refList) {
		log.info("--------------------");
		log.info(doc_no);
		log.info(refList);
		service.docRef(doc_no, refList);
		return "redirect:/document/docboard";
	}
	
	
}
