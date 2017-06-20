package com.nss.manager.answerdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nss.manager.answervo.AnswerVO;

@Repository
public class AnswerDaoImpl implements AnswerDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AnswerVO> answerList(Integer qnaNO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("answerList", qnaNO);
	}

	@Override
	public int answerInsert(AnswerVO avo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("answerInsert",avo);
	}

	@Override
	public int answerUpdate(AnswerVO avo) {
		// TODO Auto-generated method stub
		
		return sqlSession.update("answerUpdate", avo);
	}

	@Override
	public int answerDelete(int qnaNO) {
		// TODO Auto-generated method stub
		return sqlSession.delete("answerDelete", qnaNO);
	}

}
