package com.nss.manager.qnaservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nss.manager.qnadao.QnaDao;
import com.nss.manager.qnavo.QnaVO;

@Service
@Transactional
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaDao qnaDao;
	
	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		// TODO Auto-generated method stub
		return qnaDao.qnaList(qvo);
	}

	@Override
	public QnaVO qnaDetail(QnaVO qvo) {
		// TODO Auto-generated method stub
		return qnaDao.qnaDetail(qvo);
	}

	@Override
	public int qnaDelete(int qnaNO) {
		// TODO Auto-generated method stub
		int result = 0;
		result = qnaDao.qnaDelete(qnaNO);
		return result;
	}

	@Override
	public int qnaUpdate(QnaVO qvo) {
		// TODO Auto-generated method stub
		return qnaDao.qnaUpdate(qvo);
	}

	@Override
	public int qnaListCnt(QnaVO qvo) {
		// TODO Auto-generated method stub
		return qnaDao.qnaListCnt(qvo);
	}
	

}
