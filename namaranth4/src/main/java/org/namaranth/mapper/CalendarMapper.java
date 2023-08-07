package org.namaranth.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.namaranth.domain.CalendarVO;

public interface CalendarMapper {
	public List<CalendarVO> getList(int user_no);
	public CalendarVO read(int cal_no);
	public List<CalendarVO> readUserFromCalParti(int cal_no);
	
	public int isSharedCal(int cal_no);
	//public void insert(CalendarVO cal);
	
	public void insertSelectKey(CalendarVO cal);
	
	public void insertCalParti(@Param("cal_no") int cal_no, @Param("userCalParti_no") int userCalParti_no);
	
	public void deleteCalParti(int cal_no);
	public void deleteCal(int cal_no);
	
	public void updateCal(CalendarVO cal);
}
