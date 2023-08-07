package org.namaranth.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.namaranth.domain.EmailVO;
import org.namaranth.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTests {
	
	@Autowired
	private EmailMapper em;
	private EmailService es;
	
	@Autowired
	private UserMapper mapper;
	
//	@Test
//	public void test() {
//		mapper.list();
//	}
	
//	@Test
//	public void testReadUser() {
//		UsersVO vo = mapper.readUser("aaa@aaa.com");
//		log.info(vo);
//	}

//	@Test
//	public void testReadDept() {
//		String dept = mapper.readDept("aaa@aaa.com");
//		log.info(dept);
//	}

//	@Test
//	public void testReadEmail() {
//		mapper.readEmail(1);
//	}
	
//	@Test
//	public void testReadDocCom() {
//		mapper.readDoc(4);
//	}
	
	@Test
	public void testReadDocCom() {
		es.getDelList(2);
	}
}
