package org.namaranth.mapper;

import java.util.List;

import org.namaranth.domain.UsersVO;

public interface UserMapper {
	public List<UsersVO> list();
	public UsersVO readUser(String user_email);
	public String readDept(String user_email);
	public List<UsersVO> listUser();
}
