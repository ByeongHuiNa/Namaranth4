package org.namaranth.mapper;

import java.util.List;

import org.namaranth.domain.EmailVO;

public interface EmailMapper {

	public List<EmailVO> getAllList(int user_no); //��ü������
	public List<EmailVO> getSendList(int user_no); //����������
	public List<EmailVO> getReceiveList(int user_no); //����������
	public List<EmailVO> getTsList(int user_no);  //�ӽø�����
	
	public EmailVO read(int mail_no); //������ȸ
	public List<EmailVO> readReceiver(int mail_no); //���ϼ�������ȸ
	
	
	public void insert(EmailVO email); //�����ۼ�
	
	public void tsinsert(EmailVO email); //�����ۼ�
	
	public void insertReceiver(int receiver_no);//�����ۼ�������
	
	
	
	
}
