package org.namaranth.domain;

import lombok.Data;

@Data
public class CalendarVO {
	private int cal_no;
	private String cal_name;
	private String cal_color;
	private String cal_con;

	private UsersVO user;
}
