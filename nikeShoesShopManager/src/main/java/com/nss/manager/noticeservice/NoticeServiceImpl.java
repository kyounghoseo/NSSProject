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

}
