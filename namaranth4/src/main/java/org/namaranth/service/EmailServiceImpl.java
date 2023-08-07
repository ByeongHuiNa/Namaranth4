package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.EmailVO;
import org.namaranth.domain.EmailtsVO;
import org.namaranth.domain.UsersVO;
import org.namaranth.mapper.EmailMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class EmailServiceImpl implements EmailService {

	private EmailMapper mapper;
	
//	@Override
//	public List<EmailVO> getAllList(int user_no) {
//		log.info("getList..");
//		return mapper.getAllList(user_no);
//	}
	
	@Override
	public List<EmailVO> getSendList(int user_no) {
		log.info("getSendList..");
		return mapper.getSendList(user_no);
	}
	
	@Override
	public List<EmailVO> getReceiveList(int user_no) {
		log.info("getReceiveList..");
		return mapper.getReceiveList(user_no);
	}
	
	@Override
	public List<EmailVO> getDelList(int user_no) {
		log.info("getDelList..");
		return mapper.getDelList(user_no);
	}
	
	@Override
	public EmailVO get(int mail_no) {
		log.info("get......" + mail_no);
		return mapper.read(mail_no);
	}
	
	@Override
	public EmailtsVO getts(int mailts_no) {
		log.info("getts......" + mailts_no);
		return mapper.readts(mailts_no);
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

	@Override
	public void registerUser(int user_no) {
		mapper.insertReceiver(user_no);
		
	}

	@Override
	public void tsregister(EmailVO email) {
		log.info("tsregister......" + email);
		mapper.tsinsert(email);
		
	}

	@Override
	public List<EmailtsVO> getTsList(int user_no) {
		log.info("getTsList..");
		return mapper.getTsList(user_no);
	}

	@Override
	public boolean tsremove(int mailts_no) {
		log.info("tsremove..." + mailts_no);
		return mapper.tsdelete(mailts_no) == 1;
	}

	@Override
	public void emailDel(EmailVO email) {
		log.info("emailDel...");
		mapper.mailDel(email);
	}

	@Override
	public boolean restore(int mail_no) {
		log.info("restore...." + mail_no);
		return mapper.mailRestore(mail_no) == 1;
	}

	

	

	

	

}
