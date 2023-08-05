package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.DocumentVO;
import org.namaranth.domain.EmailVO;
import org.namaranth.domain.UsersVO;

public interface UserService {
	public List<UsersVO> getUserList();
	public UsersVO getUser(String user_email);
	public String getDept(String user_email);
	public List<EmailVO> getEmails(int user_no);
	public List<DocumentVO> getDoc(int user_no);
}
