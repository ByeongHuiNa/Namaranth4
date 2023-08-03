package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.CalendarVO;
import org.namaranth.mapper.CalendarMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CalendarServiceImpl implements CalendarService {

	private CalendarMapper mapper;
	
	@Override
	public List<CalendarVO> getList() {
		return mapper.getList();
	}

}
