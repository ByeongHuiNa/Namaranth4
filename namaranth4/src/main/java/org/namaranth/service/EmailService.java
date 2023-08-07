package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.EmailVO;
import org.namaranth.domain.EmailtsVO;
import org.namaranth.domain.UsersVO;

public interface EmailService {

	//public List<EmailVO> getAllList(int user_no);
	
	public List<EmailVO> getSendList(int user_no);
	
	public List<EmailVO> getReceiveList(int user_no);
	
	public List<EmailtsVO> getTsList(int user_no); //임시메일리스트select
	
	public List<EmailVO> getDelList(int user_no);
	
	public EmailVO get(int mail_no);
	
	public EmailtsVO getts(int mailts_no);
	
	public boolean tsremove(int mailts_no);
	
	public List<EmailVO> getReceiver(int mail_no);
	
	public void register(EmailVO email);
	
	public void registerUser(int user_no);
	
	public void tsregister(EmailVO email); //임시메일저장
	
	public void emailDel(EmailVO email); //메일삭제
	
	public boolean restore(int mail_no); 
}
