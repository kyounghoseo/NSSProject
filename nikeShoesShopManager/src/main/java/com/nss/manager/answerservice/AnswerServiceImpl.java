package com.nss.manager.answerservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nss.manager.answerdao.AnswerDao;
import com.nss.manager.answervo.AnswerVO;

@Service
@Transactional
public class AnswerServiceImpl implements AnswerService {

	@Autowired
	private AnswerDao answerDao;
	
	
	@Override
	public List<AnswerVO> answerList(Integer qnaNO) {
		// TODO Auto-generated method stub
		return answerDao.answerList(qnaNO);
	}

	@Override
	public int answerInsert(AnswerVO avo) {
		// TODO Auto-generated method stub
		return answerDao.answerInsert(avo);
	}

	@Override
	public int answerUpdate(AnswerVO avo) {
		// TODO Auto-generated method stub
		
		return answerDao.answerUpdate(avo);
	}

	@Override
	public int answerDelete(int answerNO) {
		// TODO Auto-generated method stub
		return answerDao.answerDelete(answerNO);
	}

}
