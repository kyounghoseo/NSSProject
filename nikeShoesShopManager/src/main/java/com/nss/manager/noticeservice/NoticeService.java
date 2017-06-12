package com.nss.manager.noticeservice;

import java.util.List;

import com.nss.manager.noticevo.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> noticeList(NoticeVO nvo);
}
