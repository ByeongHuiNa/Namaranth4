package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.EmailVO;
import org.namaranth.domain.UserVO;
import org.namaranth.mapper.EmailMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class EmailServiceImpl implements EmailService {

	private EmailMapper mapper;
	
	@Override
	public List<EmailVO> getList() {
		log.info("getList..");
		return mapper.getList();
	}
	
	@Override
	public EmailVO get(int mail_no) {
		log.info("get......" + mail_no);
		return mapper.read(mail_no);
	}
	
	@Override
	public List<EmailVO> getReceiver(int mail_no) {
		log.info("getReceiver......" + mail_no);
		return mapper.readReceiver(mail_no);
	}
	
	@Override
	public void register(EmailVO email) {
		log.info("register......" + email);
		mapper.insert(email);
		
	}

}
