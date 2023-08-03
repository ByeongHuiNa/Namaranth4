package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.DocumentVO;

public interface DocumentService {
	public List<DocumentVO> getList();
	public DocumentVO showDoc(int doc_no);
	public List<DocumentVO> getDocList();
	public void getRegi(DocumentVO vo);
}
