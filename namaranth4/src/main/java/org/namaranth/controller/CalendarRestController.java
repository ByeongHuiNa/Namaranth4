package org.namaranth.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.namaranth.domain.CalendarVO;
import org.namaranth.domain.ScheduleVO;
import org.namaranth.domain.UsersVO;
import org.namaranth.service.CalendarService;
import org.namaranth.service.ScheduleService;
import org.namaranth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/calendar")
@AllArgsConstructor
@Log4j
public class CalendarRestController {

	private ScheduleService service;
	private UserService uService;
	private CalendarService cService;
	
	
	@GetMapping("/getSchedule")
	public ResponseEntity<List<ScheduleVO>> getSchedule(Principal principal){
		String user_email = principal.getName();
	    UsersVO uVO = uService.getUser(user_email);
	    int user_no = uVO.getUser_no();
	    List<ScheduleVO> schedules = service.getSchedule(user_no);
		return new ResponseEntity<>(schedules, HttpStatus.OK);
	}
	
	@GetMapping("/pickCalendar")
	public ResponseEntity<List<ScheduleVO>> pickCalendar(Principal principal){
		String user_email = principal.getName();
	    UsersVO uVO = uService.getUser(user_email);
	    int user_no = uVO.getUser_no();
	    List<ScheduleVO> schedules = service.getSchedule(user_no);
		return new ResponseEntity<>(schedules, HttpStatus.OK);
	}
	
	@GetMapping("/showAllCalendar")
	public ResponseEntity<List<ScheduleVO>> showAllCalendar(Principal principal){
		String user_email = principal.getName();
	    UsersVO uVO = uService.getUser(user_email);
	    int user_no = uVO.getUser_no();
	    List<ScheduleVO> schedules = service.getSchedule(user_no);
	
		return new ResponseEntity<>(schedules, HttpStatus.OK);
	}
	
	@GetMapping("/calPartiList")
	public List<UsersVO> getUserList(){
      List<UsersVO> users = uService.getdeptUserList();
      return users;
   }
	
	@DeleteMapping("/delete/{cal_no}")
    public ResponseEntity<String> deleteCal(@PathVariable("cal_no") int cal_no) {
        cService.deleteCal(cal_no);
        return ResponseEntity.ok("Calendar deleted successfully.");
    }
	
	
	@GetMapping("/{cal_no}")
	public ResponseEntity<CalendarVO> get(@PathVariable("cal_no") int cal_no){
		return new ResponseEntity<>(cService.get(cal_no), HttpStatus.OK);
	}
	
//	@GetMapping("/{cal_no}/userCalParti")
//    public ResponseEntity<List<CalendarVO>> readUserFromCalParti(@PathVariable("cal_no") int cal_no) {
//        List<CalendarVO> userCalParti = cService.readUserFromCalParti(cal_no);
//
//        return new ResponseEntity<>(userCalParti, HttpStatus.OK);
//    }
	
	@GetMapping("/{cal_no}/userCalParti")
	public ResponseEntity<List<CalendarVO>> readUserFromCalParti(@PathVariable("cal_no") int cal_no) {
	    List<CalendarVO> userCalParti = null;
	    try {
	        userCalParti = cService.readUserFromCalParti(cal_no);
	    } catch (Exception e) {
	        // 예외 처리 로직 추가
	        e.printStackTrace();
	    }

	    return new ResponseEntity<>(userCalParti, HttpStatus.OK);
	}
	
	
//	@GetMapping("/{cal_no}")
//    public ResponseEntity<CalendarVO> get(@PathVariable("cal_no") int cal_no,
//                                          @RequestParam(value = "userCalParti_no", required = false) List<Integer> userCalParti_no) {
//        // userCalParti_no가 null인 경우에 대한 처리
//        if (userCalParti_no == null) {
//            userCalParti_no = new ArrayList<>();
//        }
//
//        CalendarVO result = cService.get(cal_no, userCalParti_no);
//
//        return new ResponseEntity<>(result, HttpStatus.OK);
//    }
	
}
















