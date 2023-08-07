package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.Criteria;
import org.namaranth.domain.DocumentVO;
import org.namaranth.domain.UsersVO;
import org.namaranth.mapper.DocumentMapper;
import org.namaranth.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
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
		mapper.insertRef(vo.getDoc_no(), firstAppNo);
		mapper.insertRef(vo.getDoc_no(), secondAppNo);
	}

	@Override
	public List<DocumentVO> getDocAppReqList(String user_email) {
		return mapper.appReqList(usermapper.readUser(user_email).getUser_no());
	}

	@Override
	@Transactional
	public void docApp(int doc_no, String user_email) {
		mapper.docAppInsert(doc_no, usermapper.readUser(user_email).getUser_no());
		if(mapper.getDocAppDegree(doc_no, usermapper.readUser(user_email).getUser_no()).equals("2차")) {
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

	@Override
	public UsersVO getFirstAppUser(int doc_no) {
		return mapper.docFirstApp(doc_no);
	}

	@Override
	public UsersVO getSecondAppUser(int doc_no) {
		return mapper.docSecondApp(doc_no);
	}

	@Override
	public String checkApp(int doc_no, int user_no) {
		String check = "";
		try {
			if(mapper.appCheck(doc_no, user_no) != 0) {
				check = "app";
			}
		}catch (Exception e) {}
		try {
			if(mapper.rejCheck(doc_no, user_no) != 0) {
				check = "rej";
			}
		} catch (Exception e) {}
		if(check.isEmpty()) {
			check = "none";
		}
		return check;
	}

	@Override
	public void docRef(int doc_no, List<Integer> userlist) {
		if(userlist!=null) {
			for(int i=0; i<userlist.size(); i++) {
				try {
					mapper.insertRef(doc_no, userlist.get(i));
				}catch (Exception e) {
					e.printStackTrace();
					log.warn("이미 참조된 사용자가 존재함 " + userlist.get(i));
				}
				
			}
		}
		
	}

	@Override
	public List<UsersVO> getRefUserList(int doc_no) {
		return mapper.selectRefList(doc_no);
	}

	@Override
	public List<DocumentVO> getRefDocList(String user_email) {
		return mapper.refBoardList(usermapper.readUser(user_email).getUser_no());
	}

	@Override
	public String getRejContent(int doc_no) {
		return mapper.rejContent(doc_no);
	}

	@Override
	public int getDocTotal(String user_email) {
		return mapper.getDocTotal(usermapper.readUser(user_email).getUser_no());
	}

	@Override
	public List<DocumentVO> getCriDocList(String user_email, Criteria cri) {
		return mapper.docList(usermapper.readUser(user_email).getUser_no(), cri);
	}
	
	

	

	
	

}
