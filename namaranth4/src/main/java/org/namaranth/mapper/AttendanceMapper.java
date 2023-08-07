package org.namaranth.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.namaranth.domain.AttendVO;

public interface AttendanceMapper {
	
	public List<AttendVO> attendList(int user_no);
	public AttendVO attend(int user_no);
	public int attendStart(AttendVO vo);
	public int attendEnd(@Param("at_no") int at_no, @Param("end_time") Date end_time);
	public int attendCount(Map<String, Object> params);
	public int attendStartTodayCount(int user_no);
	public int attendEndTodayCount(int user_no);
	
}
