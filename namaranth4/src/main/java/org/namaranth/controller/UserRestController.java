package org.namaranth.controller;

import java.util.List;

import org.namaranth.domain.UsersVO;
import org.namaranth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserRestController {
	@Autowired
	private UserService service;
	
	@GetMapping("/searchApprovalUser")
	public List<UsersVO> getUserList(){
		List<UsersVO> users = service.getdeptUserList();
		return users;
	}
	
}
