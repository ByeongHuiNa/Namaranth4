package org.namaranth.controller;

import java.security.Principal;
import java.util.List;

import org.namaranth.domain.Criteria;
import org.namaranth.domain.NoticeVO;
import org.namaranth.domain.PageDTO;
import org.namaranth.domain.UsersVO;
import org.namaranth.service.NoticeService;
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
@RequestMapping("/notice/*")
public class NoticeController {

	private NoticeService noticeService;
	private UserService userService;
	
	
	// 게시물 등록
    @GetMapping("/register")
    public void register(Principal principal, Model model) {
		String user_email = principal.getName();
		UsersVO users = userService.getUser(user_email);
		model.addAttribute("user", users);
		
		String deptName = userService.getDept(user_email);
		model.addAttribute("dept", deptName);
    }
    
    @PostMapping("/register")
    public String registerPost(NoticeVO vo, RedirectAttributes attr) {
    	if(noticeService.register(vo)) {
    		attr.addFlashAttribute("message", "등록 완료하였습니다.");
    	}
    	return "redirect:/notice/list";
    }
    
    // 게시물 상세 조회
	@GetMapping("/get")
	public void get(@RequestParam("noti_no") int noti_no, Principal principal, Model model) {
		String user_email = principal.getName();
		UsersVO users = userService.getUser(user_email);
		model.addAttribute("user", users);
		
		String deptName = userService.getDept(user_email);
		model.addAttribute("dept", deptName);
		
		model.addAttribute("notice", noticeService.getNotice(noti_no));
	}
	
	// 게시물 목록 조회
    @GetMapping("/list") 
    public void getList(Principal principal, Model model, Criteria cri) {
        int total = noticeService.getNoticeTotal();
        model.addAttribute("list", noticeService.getNoticeListPaging(cri));
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        log.info(noticeService.getNoticeListPaging(cri));
    	log.info(new PageDTO(cri, total));
    	
		String user_email = principal.getName();
		UsersVO users = userService.getUser(user_email);
		model.addAttribute("user", users);
		
		String deptName = userService.getDept(user_email);
		model.addAttribute("dept", deptName);
		
		/*
		 * List<NoticeVO> notices = noticeService.getNoticeList();
		 * model.addAttribute("notices", notices);
		 */
	}
    
    // 게시물 수정
    @GetMapping("/modify")
    public String modify(@RequestParam("noti_no") int noti_no, Principal principal, Model model, RedirectAttributes attr) {
    	String user_email = principal.getName();
    	UsersVO users = userService.getUser(user_email);
    	model.addAttribute("user", users);
    	
    	String deptName = userService.getDept(user_email);
    	model.addAttribute("dept", deptName);

    	if(!principal.getName().equals(noticeService.getNotice(noti_no).getUser().getUser_email())) {
			attr.addFlashAttribute("result", "fail");
			attr.addFlashAttribute("message", "작성자만 수정 가능합니다.");
			return "redirect:/notice/get?noti_no=" + noti_no;
		} else {
			NoticeVO notice = noticeService.getNotice(noti_no);
			model.addAttribute("notice", notice);
			return "notice/modify";
		}
    }
    
    @PostMapping("/modify")
    public String modifyPost(@RequestParam("noti_no") int noti_no, NoticeVO vo, RedirectAttributes attr) {
    	if(noticeService.modify(vo)) {
    		attr.addFlashAttribute("message", "수정 완료했습니다.");
    		return "redirect:/notice/get?noti_no=" + noti_no;
    	}
		attr.addFlashAttribute("message", "수정 실패했습니다.");
		return "redirect:/notice/get?noti_no=" + noti_no;
    }
    
    // 게시물 삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("noti_no") int noti_no, Principal principal, RedirectAttributes attr) {
		if(!principal.getName().equals(noticeService.getNotice(noti_no).getUser().getUser_email())) {
			attr.addFlashAttribute("result", "fail");
			attr.addFlashAttribute("message", "작성자만 삭제 가능합니다.");
			return "redirect:/notice/get?noti_no=" + noti_no;
		}
		
		if(noticeService.remove(noti_no)) {
			attr.addFlashAttribute("result", "success");
			attr.addFlashAttribute("message", "게시물 삭제 완료하였습니다.");
		}
		return "redirect:/notice/list";
	}
	 

    
}
