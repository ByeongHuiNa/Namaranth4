package org.namaranth.mapper;

import java.util.List;

import org.namaranth.domain.Criteria;
import org.namaranth.domain.NoticeVO;

public interface NoticeMapper {
	public List<NoticeVO> noticeList();
	public NoticeVO noticeDetail(int noti_no);
	public int noticeInsert(NoticeVO vo);
	public int noticeDelete(int noti_no);
	public int noticeUpdate(NoticeVO vo);
	public List<NoticeVO> noticeListWithPaging(Criteria cri);
	public int getTotalCount();
}
