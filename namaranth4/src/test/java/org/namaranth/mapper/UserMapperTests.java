package org.namaranth.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.namaranth.domain.EmailVO;
import org.namaranth.service.EmailService;
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
	
	@Autowired
	private EmailService service;
	
	private MockMvc mvc;
	
//	@Test
//	public void test() {
	
//		mapper.getList();
//	}
	@Test
	public void testGet()throws Exception {
		
		
		
		
		
//		EmailVO email = new EmailVO();
//		email.setMail_title("테스트1");
//		email.setMail_content("테스트내용1");
//		email.setUser_no(2);
//		log.info("메일번호: " + email.getMail_no());
//		service.register(email);
		
		
	}

}
