package org.namaranth.service;

import java.util.List;

import org.namaranth.domain.Criteria;
import org.namaranth.domain.NoticeVO;

public interface NoticeService {
	public List<NoticeVO> getNoticeList();
	public NoticeVO getNotice(int noti_no);
	public boolean register(NoticeVO vo);
	public boolean modify(NoticeVO vo);
	public boolean remove(int noti_no);
	public List<NoticeVO> getNoticeListPaging(Criteria cri);
	public int getNoticeTotal();
}
