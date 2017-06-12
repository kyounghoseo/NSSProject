package com.nss.manager.noticedao;

import java.util.List;

import com.nss.manager.noticevo.NoticeVO;

public interface NoticeDao {

	public List<NoticeVO> noticeList(NoticeVO nvo);
}
