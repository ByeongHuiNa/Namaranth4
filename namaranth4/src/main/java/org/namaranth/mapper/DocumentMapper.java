package org.namaranth.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.namaranth.domain.DocumentVO;

public interface DocumentMapper {
	
	//select
	public List<DocumentVO> list();
	public DocumentVO get(int doc_no);
	public List<DocumentVO> doclist(int user_no);
	public List<DocumentVO> appReqList(int user_no);
	public String getDocAppDegree(@Param("doc_no") int doc_no,@Param("user_no") int user_no);
	public List<DocumentVO> appRejList(int user_no);
	public List<DocumentVO> appComplList(int user_no);
	
	
	//insert
	public void writeDoc(DocumentVO vo);
	public void insertFisrtApp(@Param("doc_no") int doc_no,@Param("user_no") int user_no);
	public void insertSecondApp(@Param("doc_no") int doc_no,@Param("user_no") int user_no);
	public void docAppInsert(@Param("doc_no") int doc_no,@Param("user_no") int user_no);
	public void docRejInsert(@Param("doc_no") int doc_no,@Param("user_no") int user_no, @Param("docrej_content") String docrej_content);
	
	//update
	public void docAppUpdate(int doc_no);
	public void docRejUpdate(int doc_no);
	
}
