package com.nss.manager.answerservice;

import java.util.List;

import com.nss.manager.answervo.AnswerVO;


public interface AnswerService {
	
	public List<AnswerVO> answerList(Integer qnaNO);
	
	public int answerInsert(AnswerVO avo);
	
	/*public int pwdConfirm(ReplyVO rvo);*/
	
	public int answerUpdate(AnswerVO avo);
	
	public int answerDelete(int answerNO);

}
