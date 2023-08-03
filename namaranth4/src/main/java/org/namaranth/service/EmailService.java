package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.EmailVO;
import org.namaranth.domain.UsersVO;

public interface EmailService {

	public List<EmailVO> getAllList(int user_no);
	
	public List<EmailVO> getSendList(int user_no);
	
	public List<EmailVO> getReceiveList(int user_no);
	
	public EmailVO get(int mail_no);
	
	public List<EmailVO> getReceiver(int mail_no);
	
	public void register(EmailVO email);
	
	public void registerUser(int user_no);
}
