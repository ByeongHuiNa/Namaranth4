package org.namaranth.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserServiceTests {

	@Autowired
	private UserService service;
	
//	@Test
//	public void test() {
//		service.getDept("aaa@aaa.com");
//	}

//	@Test
//	public void testEmail() {
//		service.getEmails(1);
//	}
	
	@Test
	public void testDoc() {
		service.getUserByName("ÀÌÀ¯³ª");
	}
}
