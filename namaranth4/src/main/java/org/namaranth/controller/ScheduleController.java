package org.namaranth.controller;

import java.util.List;

import org.namaranth.domain.ScheduleVO;
import org.namaranth.domain.UsersVO;
import org.namaranth.service.ScheduleService;
import org.namaranth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/calendar")
@AllArgsConstructor
public class ScheduleController {

	private ScheduleService service;
	
	@Autowired
	private UserService uService;
	
	@GetMapping("/getSchedule")
	public ResponseEntity<List<ScheduleVO>> getSchedule(){
	
	
		return new ResponseEntity<>(service.getSchedule(), HttpStatus.OK);
	}
	
	@GetMapping("/pickCalendar")
	public ResponseEntity<List<ScheduleVO>> pickCalendar(){
	
	
		return new ResponseEntity<>(service.getSchedule(), HttpStatus.OK);
	}
	
	@GetMapping("/showAllCalendar")
	public ResponseEntity<List<ScheduleVO>> showAllCalendar(){
	
	
		return new ResponseEntity<>(service.getSchedule(), HttpStatus.OK);
	}
	
	@GetMapping("/calPartiList")
	public List<UsersVO> getUserList(){
      List<UsersVO> users = uService.getdeptUserList();
      return users;
      //return new ResponseEntity<>(uService.getdeptUserList(), HttpStatus.OK);
   }
	
}
