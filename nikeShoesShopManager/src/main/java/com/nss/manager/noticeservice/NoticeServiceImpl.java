package com.nss.manager.noticeservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nss.manager.noticedao.NoticeDao;
import com.nss.manager.noticevo.NoticeVO;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;

	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		// TODO Auto-generated method stub

		List<NoticeVO> ntList = null;
		ntList = noticeDao.noticeList(nvo);
		return ntList;
	}

	@Override
	public int noticeListCnt(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return noticeDao.noticeListCnt(nvo);
	}

	@Override
	public int noticeInsert(NoticeVO nvo) {
		// TODO Auto-generated method stub
		int result = 0;
		result = noticeDao.noticeInsert(nvo);
		return result;
	}

	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		// TODO Auto-generated method stub
		NoticeVO detail = null;
		detail = noticeDao.noticeDetail(nvo);
		return detail;
	}

}
