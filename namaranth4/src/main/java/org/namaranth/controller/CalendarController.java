package org.namaranth.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.namaranth.domain.CalendarVO;
import org.namaranth.domain.ScheduleVO;
import org.namaranth.domain.UsersVO;
import org.namaranth.service.CalendarService;
import org.namaranth.service.ScheduleService;
import org.namaranth.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/calendar")
@AllArgsConstructor
@Log4j
public class CalendarController {
	
	private CalendarService service;
	private UserService uService;
	private ScheduleService sService;
	
	@GetMapping("/calendar")
	public void calendar(Principal principal, Model model) {		
		String user_email = principal.getName();
		UsersVO uVO = uService.getUser(user_email);
        model.addAttribute("user", uVO);  
        String deptName = uService.getDept(user_email);
        model.addAttribute("dept", deptName);
        
        // user_no를 사용하여 조회
        model.addAttribute("list", service.getList(uVO.getUser_no()));                      
	}
	
//	@GetMapping("/get")
//	public void updateCal(@RequestParam("cal_no") int cal_no, Model model) {
//		model.addAttribute("cal", service.get(cal_no));
//	}
	
//	@PostMapping("/register")
//	public String register(CalendarVO cal) {
//		service.register(cal);
//		
//		return "redirect:/calendar/calendar";
//	}
	
	
	@PostMapping("/register")
	public String registerCal(CalendarVO cal, @RequestParam(value="calParti_no[]", required = false) List<Integer> calParti_no) {
		log.info(cal);
		log.info(calParti_no);
	
		service.registerCal(cal, calParti_no);
		
		return "redirect:/calendar/calendar";
	}
	
	@PostMapping("/update")
    public String updateCal(CalendarVO cal, @RequestParam(value="calParti_no[]", required = false) 
    	List<Integer> calParti_no) {
		log.info(cal);
		log.info(calParti_no);
        
		service.updateCal(cal, calParti_no);
        
        return "redirect:/calendar/calendar";
    }
	
	
	//스케줄 등록
	@PostMapping("/regiSch")
	public String registerSch(ScheduleVO sch, 
			@RequestParam("start") Long start, @RequestParam("end") Long end) {
		log.info(sch);
		log.info(start);
	    log.info(end);

	    Date startDate = new Date(start);
	    Date endDate = new Date(end);
	     
	    
	    log.info(startDate);
	    log.info(endDate);
	    
	    sch.setSch_start(startDate);
	    sch.setSch_end(endDate);

		sService.registerSch(sch);
		
		return "redirect:/calendar/calendar";
	}

	
}





