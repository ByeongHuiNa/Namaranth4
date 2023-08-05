package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.DocumentVO;

public interface DocumentService {
	
	public List<DocumentVO> getList();
	public DocumentVO showDoc(int doc_no);
	public List<DocumentVO> getDocList(String user_email);
	public List<DocumentVO> getDocAppReqList(String user_email);
	public List<DocumentVO> getDocAppRejList(String user_email);
	public List<DocumentVO> getDocAppComplList(String user_email);
	//public void getRegi(DocumentVO vo);
	public void getRegi(DocumentVO vo, int firstAppNo, int secondAppNo);
	public void docApp(int doc_no, String user_email);
	public void docRej(int doc_no, String user_email, String rej_content);
	
	
}
