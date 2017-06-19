package com.nss.manager.answerdao;

import java.util.List;

import com.nss.manager.answervo.AnswerVO;

public interface AnswerDao {
	
public List<AnswerVO> answerList(Integer qnaNO);
	
	public int answerInsert(AnswerVO avo);
	
	/*public int pwdConfirm(ReplyVO rvo);*/
	
	public int answerUpdate(AnswerVO avo);
	
	public int answerDelete(int qnaNO);

}
