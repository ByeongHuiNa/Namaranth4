package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.NoteVO;
import org.namaranth.mapper.NoteMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class NoteServiceImpl implements NoteService {

	@Autowired
	private NoteMapper mapper;
	
	@Override
	public List<NoteVO> getList(int user_no) {
		return mapper.noteList(user_no);
	}

	@Override
	public NoteVO get(int note_no) {
		return mapper.noteDetail(note_no);
	}

	@Override
	public int register(NoteVO vo) {
		return mapper.noteInsert(vo);
	}

	@Override
	public int modify(NoteVO vo) {
		return mapper.noteUpdate(vo);
	}

	@Override
	public int remove(int note_no) {
		return mapper.noteDelete(note_no);
	}
	

}
