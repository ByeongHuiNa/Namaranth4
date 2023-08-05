package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.UsersVO;
import org.namaranth.mapper.UserMapper;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
@Repository
public class UserServiceImpl implements UserService {

	private UserMapper mapper;
	
	@Override
	public List<UsersVO> getUserList() {
		log.info("get User List");
		return mapper.list();
	}

	@Override
	public UsersVO getUser(String user_email) {
		log.info("get User");
		log.info(mapper.readUser(user_email));
		return mapper.readUser(user_email);
	}

	@Override
	public String getDept(String user_email) {
		log.info("get Dept");
		log.info(mapper.readDept(user_email));
		return mapper.readDept(user_email);
	}
	
	@Override
	  public List<UsersVO> getdeptUserList() {
	      log.info("get dept and user list");
	      return mapper.listUser();
	 }

	@Override
	public List<UsersVO> getdeptUserList() {
		log.info("get dept and user list");
		return mapper.listUser();
	}

}
