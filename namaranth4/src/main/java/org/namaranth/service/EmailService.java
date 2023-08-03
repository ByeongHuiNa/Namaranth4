package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.EmailVO;
import org.namaranth.domain.UserVO;

public interface EmailService {

	public List<EmailVO> getList();
	
	public EmailVO get(int mail_no);
	
	public List<EmailVO> getReceiver(int mail_no);
	
	public void register(EmailVO email);
}
