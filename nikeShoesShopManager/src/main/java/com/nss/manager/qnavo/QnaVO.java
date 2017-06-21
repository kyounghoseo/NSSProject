package com.nss.manager.qnavo;

import com.nss.manager.common.PagingVO;

public class QnaVO extends PagingVO {

	private int qnaNO;
	private int customerNO;
	private String qnaWriter;
	private String qnaCsid;
	private String qnaTitle;
	private String qnaContents;
	private String qnaDate;
	private String qnaAnswer;

	private String qna_check;

	private String keyword="";
	private String search="";
	
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getQnaContents() {
		return qnaContents;
	}

	public void setQnaContents(String qnaContents) {
		this.qnaContents = qnaContents;
	}

	public int getQnaNO() {
		return qnaNO;
	}

	public void setQnaNO(int qnaNO) {
		this.qnaNO = qnaNO;
	}

	public int getCustomerNO() {
		return customerNO;
	}

	public void setCustomerNO(int customerNO) {
		this.customerNO = customerNO;
	}

	public String getQnaWriter() {
		return qnaWriter;
	}

	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(String qnaDate) {
		this.qnaDate = qnaDate;
	}

	public String getQna_check() {
		return qna_check;
	}

	public void setQna_check(String qna_check) {
		this.qna_check = qna_check;
	}

	public String getQnaAnswer() {
		return qnaAnswer;
	}

	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}

	public String getQnaCsid() {
		return qnaCsid;
	}

	public void setQnaCsid(String qnaCsid) {
		this.qnaCsid = qnaCsid;
	}

}
