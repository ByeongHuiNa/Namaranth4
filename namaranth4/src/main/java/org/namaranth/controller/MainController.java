package org.namaranth.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.namaranth.domain.AttendVO;
import org.namaranth.domain.NoteVO;
import org.namaranth.domain.UsersVO;
import org.namaranth.service.AttendanceService;
import org.namaranth.service.NoteService;
import org.namaranth.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/page/")
@Log4j
@AllArgsConstructor
public class MainController {

	private UserService userService;
	private NoteService noteService;
	private AttendanceService attendanceService;
	
	// 메모 등록
	@PostMapping("notes/new")
	public ResponseEntity<String> register(@RequestBody NoteVO vo){
		log.info("NoteVO : " + vo);
		int result = noteService.register(vo);
		
		return result == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 메모 삭제
	@DeleteMapping("notes/delete/{note_no}")
	public ResponseEntity<String> remove(@PathVariable("note_no") int note_no){
		log.info("note_no : " + note_no);
		return noteService.remove(note_no) == 1 ?
				new ResponseEntity<String>("success", HttpStatus.OK) : 
				new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 메모 수정
	@PatchMapping("notes/update/{note_no}")
	public ResponseEntity<String> modify(@RequestBody NoteVO vo, @PathVariable("note_no") int note_no){
		log.info("note_no : " + note_no);
		log.info("NoteVO : " + vo);
		
		return noteService.modify(vo) == 1 ?
				new ResponseEntity<String>("success", HttpStatus.OK) : 
				new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 특정 사용자의 전체 메모 리스트 가져오기
	@GetMapping("notes/list/{user_no}")
	public ResponseEntity<List<NoteVO>> noteList(@PathVariable("user_no") int user_no){
		log.info("user_no : " + user_no);
		return new ResponseEntity<>(noteService.getList(user_no), HttpStatus.OK);
	}
	
	// 출근
	@PostMapping("attend/start/{user_no}")
    public ResponseEntity<String> startAttendance(@RequestBody AttendVO vo, @PathVariable("user_no") int user_no) {
		
		Map<String, Object> params = new HashMap<>();
		params.put("user_no", user_no);
		params.put("start_time", vo.getStart_time());
		
		if(attendanceService.isExistStart(params)){
			return new ResponseEntity<>("fail", HttpStatus.OK);
		}
		
		attendanceService.updateStart(vo);
		return new ResponseEntity<>("success", HttpStatus.OK);
    } 
	
	// 퇴근
	@PostMapping("attend/end/{user_no}")
    public ResponseEntity<String> endAttendance(@RequestBody AttendVO vo, @PathVariable("user_no") int user_no) {
		log.info(vo);
		
		if(!attendanceService.isExistStartToday(user_no)){
			return new ResponseEntity<>("fail", HttpStatus.OK);
		}
		
		if(attendanceService.isExistEndToday(user_no)){
			return new ResponseEntity<>("already success", HttpStatus.OK);
		}
		
		attendanceService.updateEnd(vo.getAt_no(), vo.getEnd_time());
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	// 이름으로 검색
	@GetMapping("/search/users/{user_name}")
	public List<UsersVO> searchUsers(@PathVariable("user_name") String user_name){
		List<UsersVO> users = userService.getUserByName(user_name);
		return users;
	}
	
}






