package org.namaranth.mapper;

import java.util.List;

import org.namaranth.domain.EmailVO;

public interface EmailMapper {

	public List<EmailVO> getList(); //��ü������
	public EmailVO read(int mail_no); //������ȸ
	public List<EmailVO> readReceiver(int mail_no); //���ϼ�������ȸ
	
	public void insert(EmailVO email); //�����ۼ�
	
}
