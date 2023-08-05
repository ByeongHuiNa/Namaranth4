package org.namaranth.controller;

import java.util.List;

import org.namaranth.domain.NoteVO;
import org.namaranth.service.NoteService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/notes/")
@Log4j
@AllArgsConstructor
public class MainController {

	private NoteService noteService;
	
	// 메모 등록
	@PostMapping("new")
	public ResponseEntity<String> register(@RequestBody NoteVO vo){
		log.info("NoteVO : " + vo);
		int result = noteService.register(vo);
		
		return result == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 메모 삭제
	@DeleteMapping("delete/{note_no}")
	public ResponseEntity<String> remove(@PathVariable("note_no") int note_no){
		log.info("note_no : " + note_no);
		return noteService.remove(note_no) == 1 ?
				new ResponseEntity<String>("success", HttpStatus.OK) : 
				new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 메모 수정
	@PatchMapping("update/{note_no}")
	public ResponseEntity<String> modify(@RequestBody NoteVO vo, @PathVariable("note_no") int note_no){
		log.info("note_no : " + note_no);
		log.info("NoteVO : " + vo);
		
		return noteService.modify(vo) == 1 ?
				new ResponseEntity<String>("success", HttpStatus.OK) : 
				new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 특정 사용자의 전체 메모 리스트 가져오기
	@GetMapping("list/{user_no}")
	public ResponseEntity<List<NoteVO>> noteList(@PathVariable("user_no") int user_no){
		log.info("user_no : " + user_no);
		return new ResponseEntity<>(noteService.getList(user_no), HttpStatus.OK);
		
	}
}






