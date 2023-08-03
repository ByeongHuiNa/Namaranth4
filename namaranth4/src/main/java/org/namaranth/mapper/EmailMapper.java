package org.namaranth.mapper;

import java.util.List;

import org.namaranth.domain.EmailVO;

public interface EmailMapper {

	public List<EmailVO> getAllList(int user_no); //전체메일함
	public List<EmailVO> getSendList(int user_no); //보낸메일함
	public EmailVO read(int mail_no); //메일조회
	public List<EmailVO> readReceiver(int mail_no); //메일수신자조회
	
	public void insert(EmailVO email); //메일작성
	
	public void insertReceiver(int receiver_no);//메일작성수신자
	
	public List<EmailVO> getReceiveList(int user_no); //받은메일함
	
	
}
