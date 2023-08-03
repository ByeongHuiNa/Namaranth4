package org.namaranth.mapper;

import java.util.List;

import org.namaranth.domain.DocumentVO;

public interface DocumentMapper {
	public List<DocumentVO> list();
	public DocumentVO get(int doc_no);
	public List<DocumentVO> doclist();
	public void writeDoc(DocumentVO vo);
}
