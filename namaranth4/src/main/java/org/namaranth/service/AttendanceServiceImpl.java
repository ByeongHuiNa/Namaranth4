package org.namaranth.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.namaranth.domain.AttendVO;
import org.namaranth.mapper.AttendanceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AttendanceServiceImpl implements AttendanceService {

	@Autowired
	private AttendanceMapper mapper;
	
	@Override
	public List<AttendVO> getList(int user_no) {
		return mapper.attendList(user_no);
	}

	@Override
	public AttendVO get(int user_no) {
		return mapper.attend(user_no);
	}

	@Override
	public int updateStart(AttendVO vo) {
		return mapper.attendStart(vo);
	}

	@Override
	public int updateEnd(int at_no, Date end_time) {
		return mapper.attendEnd(at_no, end_time);
	}

	@Override
	public boolean isExistStart(Map<String, Object> params) {
		return mapper.attendCount(params) > 0;
	}

	@Override
	public boolean isExistStartToday(int user_no) {
		return mapper.attendStartTodayCount(user_no) > 0;
	}

	@Override
	public boolean isExistEndToday(int user_no) {
		return mapper.attendEndTodayCount(user_no) > 0;
	}

}
