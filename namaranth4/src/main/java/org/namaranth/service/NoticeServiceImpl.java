package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.Criteria;
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

	@Override
	public NoticeVO getNotice(int noti_no) {
		return mapper.noticeDetail(noti_no);
	}

	@Override
	public boolean register(NoticeVO vo) {
		return mapper.noticeInsert(vo) == 1; 
	} // 잘 처리되면 1 : true

	@Override
	public boolean remove(int noti_no) {
		return mapper.noticeDelete(noti_no) == 1;
	} // 잘 처리되면 1 : true

	@Override
	public boolean modify(NoticeVO vo) {
		return mapper.noticeUpdate(vo) == 1;
	} // 잘 처리되면 1 : true

	@Override
	public List<NoticeVO> getNoticeListPaging(Criteria cri) {
		return mapper.noticeListWithPaging(cri);
	}

	@Override
	public int getNoticeTotal() {
		return mapper.getTotalCount();
	}

}
