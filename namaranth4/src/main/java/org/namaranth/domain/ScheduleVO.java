package org.namaranth.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ScheduleVO {
	private int sch_no;
	private int cal_no;
	private int user_no;
	private String sch_name;
	private Date sch_start;
	private Date sch_end;
	private String sch_place;
	private String sch_noti;
	private String sch_con;
	private boolean cal_allday = false;
}
