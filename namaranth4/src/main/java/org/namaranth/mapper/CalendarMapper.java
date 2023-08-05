package org.namaranth.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.namaranth.domain.CalendarVO;

public interface CalendarMapper {
	public List<CalendarVO> getList();
	
	//public void insert(CalendarVO cal);
	
	public void insertSelectKey(CalendarVO cal);
	
	public void insertCalParti(@Param("cal_no") int cal_no, @Param("userCalParti_no") int userCalParti_no);
}
