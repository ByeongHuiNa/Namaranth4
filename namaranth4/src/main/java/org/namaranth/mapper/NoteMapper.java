package org.namaranth.mapper;

import java.util.List;

import org.namaranth.domain.NoteVO;

public interface NoteMapper {
	public List<NoteVO> noteList(int user_no);
	public NoteVO noteDetail(int note_no);
	public int noteInsert(NoteVO vo);
	public int noteDelete(int note_no);
	public int noteUpdate(NoteVO vo);
}
