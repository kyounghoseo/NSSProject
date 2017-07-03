package com.nss.manager.qnadao;

import java.util.List;

import com.nss.manager.qnavo.QnaVO;

public interface QnaDao {
	
	public List<QnaVO> qnaList(QnaVO qvo);
	
	public QnaVO qnaDetail(QnaVO qvo);
	
	public int qnaDelete(int qnaNO);
	
	public int qnaUpdate(QnaVO qvo);

	public int qnaListCnt(QnaVO qvo);
}
