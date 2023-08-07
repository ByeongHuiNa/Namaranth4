package org.namaranth.mapper;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AttendanceMappterTests {

	@Autowired
	private AttendanceMapper mapper;
	
	@Test
	public void test() {
		Map<String, Object> params = new HashMap<>();
		params.put("user_no", 1);
		params.put("start_time", new Date());
		mapper.attendCount(params);
	}
}
