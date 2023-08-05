package org.namaranth.mapper;

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
public class DocumentMapperTests {
	
	@Autowired
	private DocumentMapper mapper;
	
	@Test
	public void test() {
		DocumentVO vo = new DocumentVO();
		UsersVO user = new UsersVO();
		vo.setUser(user);
		vo.setDoc_no(4);
		vo.getUser().setUser_no(1);
		vo.setDoc_title("test����");
		vo.setDoc_content("test����");
		mapper.writeDoc(vo);
	}
	
//	public void test() {
//		mapper.get(1);
//	}

}
