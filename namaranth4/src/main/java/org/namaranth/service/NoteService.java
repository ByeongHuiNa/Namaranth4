package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.NoteVO;

public interface NoteService {
	public List<NoteVO> getList(int user_no);
	public NoteVO get(int note_no);
	public int register(NoteVO vo);
	public int modify(NoteVO vo);
	public int remove(int note_no);
}
