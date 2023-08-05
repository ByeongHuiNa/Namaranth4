package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.DocumentVO;
import org.namaranth.mapper.DocumentMapper;
import org.namaranth.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DocumentServiceImpl implements DocumentService {

	@Autowired
	private DocumentMapper mapper;
	
	@Autowired UserMapper usermapper;
	
	@Override
	public List<DocumentVO> getList() {
		return mapper.list();
	}

	@Override
	public DocumentVO showDoc(int doc_no) {
		return mapper.get(doc_no);
	}

	@Override
	public List<DocumentVO> getDocList(String user_email) {
		return mapper.doclist(usermapper.readUser(user_email).getUser_no());
	}

	@Override
	@Transactional
	public void getRegi(DocumentVO vo ,int firstAppNo, int secondAppNo) {
		mapper.writeDoc(vo);
		mapper.insertFisrtApp(vo.getDoc_no(), firstAppNo);
		mapper.insertSecondApp(vo.getDoc_no(), secondAppNo);
	}

	@Override
	public List<DocumentVO> getDocAppReqList(String user_email) {
		return mapper.appReqList(usermapper.readUser(user_email).getUser_no());
	}

	@Override
	@Transactional
	public void docApp(int doc_no, String user_email) {
		mapper.docAppInsert(doc_no, usermapper.readUser(user_email).getUser_no());
		if(mapper.getDocAppDegree(doc_no, usermapper.readUser(user_email).getUser_no()).equals("2Â÷")) {
			mapper.docAppUpdate(doc_no);
		}
	}

	@Override
	@Transactional
	public void docRej(int doc_no, String user_email, String rej_content) {
		mapper.docRejInsert(doc_no, usermapper.readUser(user_email).getUser_no(), rej_content);
		mapper.docRejUpdate(doc_no);
	}

	@Override
	public List<DocumentVO> getDocAppRejList(String user_email) {
		return mapper.appRejList(usermapper.readUser(user_email).getUser_no());
	}

	@Override
	public List<DocumentVO> getDocAppComplList(String user_email) {
		return mapper.appComplList(usermapper.readUser(user_email).getUser_no());
	}
	
	

}
