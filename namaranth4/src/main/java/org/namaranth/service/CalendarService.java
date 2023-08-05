package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.CalendarVO;

public interface CalendarService {
	public List<CalendarVO> getList();
	
	//public void register(CalendarVO cal);
	
	public void registerCal(CalendarVO cal, List<Integer> userCalParti_no);
}
