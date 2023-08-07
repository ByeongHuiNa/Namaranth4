package org.namaranth.mapper;

import java.util.List;

import org.namaranth.domain.EmailVO;
import org.namaranth.domain.EmailtsVO;

public interface EmailMapper {

	public List<EmailVO> getAllList(int user_no); //��ü������
	public List<EmailVO> getSendList(int user_no); //����������
	public List<EmailVO> getReceiveList(int user_no); //����������
	public List<EmailtsVO> getTsList(int user_no);  //�ӽø�����
	public List<EmailVO> getDelList(int user_no);
	
	public EmailVO read(int mail_no); //������ȸ
	
	public EmailtsVO readts(int mailts_no); //�ӽø�����ȸ
	
	public int tsdelete(int mailts_no); //�ӽø��ϻ���
	
	public List<EmailVO> readReceiver(int mail_no); //���ϼ�������ȸ
	
	public void insert(EmailVO email); //�����ۼ�
	
	public void tsinsert(EmailVO email); //�����ۼ�
	
	public void insertReceiver(int receiver_no);//�����ۼ�������
	
	public void mailDel(EmailVO email); //���ϻ���
	
	public int mailRestore(int mail_no); //���Ϻ���
	
	
	
}
