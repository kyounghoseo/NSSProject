package com.nss.manager.qnadao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nss.manager.qnavo.QnaVO;

@Repository
public class QnaDaoImpl implements QnaDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qnaList",qvo);
	}

	@Override
	public QnaVO qnaDetail(QnaVO qvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("qnaDetail",qvo);
	}

	@Override
	public int qnaDelete(int qnaNO) {
		// TODO Auto-generated method stub
		return sqlSession.delete("qnaDelete",qnaNO);
	}

}
