package org.namaranth.mapper;

import java.util.List;

import org.namaranth.domain.ScheduleVO;

public interface ScheduleMapper {
	public List<ScheduleVO> getSchedule(int user_no);
	
	public void insertSelectKey(ScheduleVO sch);
}
