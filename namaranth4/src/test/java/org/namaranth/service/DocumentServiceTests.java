package org.namaranth.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.namaranth.domain.DocumentVO;
import org.namaranth.domain.UsersVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DocumentServiceTests {

	@Autowired
	private DocumentService service;
	
	@Test
	public void test() {
		log.info("list test....");
		DocumentVO vo = new DocumentVO();
		vo.setUser(new UsersVO());
		vo.setDoc_no(5);
		vo.setDoc_content("test2");
		vo.setDoc_title("title2");
		vo.getUser().setUser_no(1);
		service.getRegi(vo);
	}

}
