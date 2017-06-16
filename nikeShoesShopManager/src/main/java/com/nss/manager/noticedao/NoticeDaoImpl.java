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

	@Override
	public int noticeListCnt(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return (Integer) session.selectOne("noticeListCnt", nvo);
	}

	@Override
	public int noticeInsert(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return session.insert("noticeInsert", nvo);
	}

	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return (NoticeVO) session.selectOne("noticeDetail", nvo);
	}

	@Override
	public int noticeUpdate(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return session.update("noticeUpdate", nvo);
	}

	@Override
	public int noticeDelete(int noticeNo) {
		// TODO Auto-generated method stub
		return session.delete("noticeDelete", noticeNo);
	}

}
