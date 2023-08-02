package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.EmailVO;

public interface EmailService {

	public List<EmailVO> getList();
	
	public EmailVO get(int mail_no);
}
