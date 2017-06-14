package com.nss.manager.noticedao;

import java.util.List;

import com.nss.manager.noticevo.NoticeVO;

public interface NoticeDao {

	public List<NoticeVO> noticeList(NoticeVO nvo);
	
	public int noticeListCnt(NoticeVO nvo);
	
	public int noticeInsert(NoticeVO nvo);
	
	public NoticeVO noticeDetail(NoticeVO nvo);
}
