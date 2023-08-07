package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.CalendarVO;

public interface CalendarService {
	public List<CalendarVO> getList(int user_no);
	
	public CalendarVO get(int cal_no);
	public List<CalendarVO> readUserFromCalParti(int cal_no);
	//public CalendarVO get(int cal_no, List<Integer> userCalParti_no);
	
	//public void register(CalendarVO cal);
	
	public void registerCal(CalendarVO cal, List<Integer> userCalParti_no);
	
	public void deleteCal(int cal_no);
	
	public void updateCal(CalendarVO cal, List<Integer> userCalParti_no);
	
}
