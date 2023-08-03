package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.UsersVO;

public interface UserService {
	public List<UsersVO> getUserList();
	public UsersVO getUser(String user_email);
	public String getDept(String user_email);
}
