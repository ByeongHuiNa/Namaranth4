package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.DocumentVO;
import org.namaranth.mapper.DocumentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DocumentServiceImpl implements DocumentService {

	@Autowired
	private DocumentMapper mapper;
	
	@Override
	public List<DocumentVO> getList() {
		return mapper.list();
	}

	@Override
	public DocumentVO showDoc(int doc_no) {
		return mapper.get(doc_no);
	}

	@Override
	public List<DocumentVO> getDocList() {
		return mapper.doclist();
	}

	@Override
	public void getRegi(DocumentVO vo) {
		mapper.writeDoc(vo);
	}
	
	

}
