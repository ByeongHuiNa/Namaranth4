package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.Criteria;
import org.namaranth.domain.DocumentVO;
import org.namaranth.domain.UsersVO;

public interface DocumentService {
	
	public List<DocumentVO> getList();
	public DocumentVO showDoc(int doc_no);
	public List<DocumentVO> getDocList(String user_email);
	public List<DocumentVO> getDocAppReqList(String user_email);
	public List<DocumentVO> getDocAppRejList(String user_email);
	public List<DocumentVO> getDocAppComplList(String user_email);
	public List<DocumentVO> getRefDocList(String user_email);
	public String getRejContent(int doc_no);
	public UsersVO getFirstAppUser(int doc_no);
	public UsersVO getSecondAppUser(int doc_no);
	public List<UsersVO>  getRefUserList(int doc_no);
	public String checkApp(int doc_no, int user_no);
	//public void getRegi(DocumentVO vo);
	public void getRegi(DocumentVO vo, int firstAppNo, int secondAppNo);
	public void docApp(int doc_no, String user_email);
	public void docRej(int doc_no, String user_email, String rej_content);
	public void docRef(int doc_no, List<Integer> userlist);
	public int getDocTotal(String user_email);
	
	
	//Cri list
	public List<DocumentVO> getCriDocList(String user_email, Criteria cri);
}
