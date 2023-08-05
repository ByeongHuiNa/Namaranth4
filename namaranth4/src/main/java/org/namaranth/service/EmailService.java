package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.EmailVO;
import org.namaranth.domain.UsersVO;

public interface EmailService {

	public List<EmailVO> getAllList(int user_no);
	
	public List<EmailVO> getSendList(int user_no);
	
	public List<EmailVO> getReceiveList(int user_no);
	
	public List<EmailVO> getTsList(int user_no); //임시메일select
	
	public EmailVO get(int mail_no);
	
	public List<EmailVO> getReceiver(int mail_no);
	
	public void register(EmailVO email);
	
	public void registerUser(int user_no);
	
	public void tsregister(EmailVO email); //임시메일저장
}
