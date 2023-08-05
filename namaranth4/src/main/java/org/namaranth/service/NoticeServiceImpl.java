package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.NoticeVO;
import org.namaranth.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;
	
	@Override
	public List<NoticeVO> getNoticeList() {
		return mapper.noticeList();
	}

}
