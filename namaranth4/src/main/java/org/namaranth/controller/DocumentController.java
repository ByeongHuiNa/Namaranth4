package org.namaranth.controller;

import org.namaranth.domain.DocumentVO;
import org.namaranth.service.DocumentService;
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
	
//	@GetMapping("/docboard")
//	public void docboard(Model model) {
//		model.addAttribute("list",service.getList());
//	}
	
	@GetMapping("/docboard")
	public void docboard(Model model) {
		model.addAttribute("list",service.getDocList());
	}
	
	@GetMapping("/docshow")
	public void showdoc(@RequestParam("doc_no") int doc_no, Model model) {
		log.info(doc_no);
		model.addAttribute("get", service.showDoc(doc_no));
	}
	
	@GetMapping("/docregi")
	public void docregi() {
		
	}
	@PostMapping("/docregi")
	public String docregister(@ModelAttribute DocumentVO vo) {
		log.info("resi....");
		service.getRegi(vo);
		return "redirect:/document/docboard";
	}
}
