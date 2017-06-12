package com.nss.manager.noticedao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nss.manager.noticevo.NoticeVO;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return session.selectList("noticeList", nvo);
	}

}
