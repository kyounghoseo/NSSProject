package com.nss.manager.qnavo;

public class QnaVO {

	private int qnaNO;
	private int customerNO;
	private String qnaWriter;
	private String qnaTitle;
	private String qnaContents;
	private String qnaDate;

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

}
