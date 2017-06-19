package com.nss.manager.qnaservice;

import java.util.List;

import com.nss.manager.qnavo.QnaVO;

public interface QnaService {
	
	public List<QnaVO> qnaList(QnaVO qvo);
	
	public QnaVO qnaDetail(QnaVO qvo);

	public int qnaDelete(int qnaNO);
}
