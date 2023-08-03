package org.namaranth.controller;

import java.util.List;

import org.namaranth.domain.ScheduleVO;
import org.namaranth.service.ScheduleService;
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
	
	@GetMapping("/getList")
	public ResponseEntity<List<ScheduleVO>> getCalendar(){
	
	
	return new ResponseEntity<>(service.getSchedule(), HttpStatus.OK);
	}
}
