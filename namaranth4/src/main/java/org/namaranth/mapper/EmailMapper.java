package org.namaranth.mapper;

import java.util.List;

import org.namaranth.domain.EmailVO;

public interface EmailMapper {

	public List<EmailVO> getList(); //전체메일함
	public EmailVO read(int mail_no); //메일조회
	public List<EmailVO> readReceiver(int mail_no); //메일수신자조회
	
	public void insert(EmailVO email); //메일작성
	
}
