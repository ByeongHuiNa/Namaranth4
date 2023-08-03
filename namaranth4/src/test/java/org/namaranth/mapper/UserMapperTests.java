package org.namaranth.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.namaranth.domain.UsersVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTests {
	
	@Autowired
	private EmailMapper mapper;
	
//	@Test
//	public void test() {
//		mapper.list();
//	}
	
//	@Test
//	public void testReadUser() {
//		UsersVO vo = mapper.readUser("aaa@aaa.com");
//		log.info(vo);
//	}

	@Test
	public void testReadDept() {
		String dept = mapper.readDept("aaa@aaa.com");
		log.info(dept);
	}
}
