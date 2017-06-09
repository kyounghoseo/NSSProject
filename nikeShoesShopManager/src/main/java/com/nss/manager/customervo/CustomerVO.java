package com.nss.manager.customervo;

import com.nss.manager.common.PagingVO;

public class CustomerVO extends PagingVO {

	private int customerNo;
	private String customerId;
	private String customerPw;
	private String customerName;
	private String customerCellphone;
	private String customerEmail;
	private String customerBirth;
	private String customerGender;
	private String customerAccept;
	private String customerDate;
	private String customerCheck;

	// 라디오버튼 검색시 필드
	private String customer_check = "";

	// 조건 검색시 필드
	private String keyword = "";
	private String search = "";

	public int getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getCustomerPw() {
		return customerPw;
	}

	public void setCustomerPw(String customerPw) {
		this.customerPw = customerPw;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerCellphone() {
		return customerCellphone;
	}

	public void setCustomerCellphone(String customerCellphone) {
		this.customerCellphone = customerCellphone;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getCustomerBirth() {
		return customerBirth;
	}

	public void setCustomerBirth(String customerBirth) {
		this.customerBirth = customerBirth;
	}

	public String getCustomerGender() {
		return customerGender;
	}

	public void setCustomerGender(String customerGender) {
		this.customerGender = customerGender;
	}

	public String getCustomerAccept() {
		return customerAccept;
	}

	public void setCustomerAccept(String customerAccept) {
		this.customerAccept = customerAccept;
	}

	public String getCustomerDate() {
		return customerDate;
	}

	public void setCustomerDate(String customerDate) {
		this.customerDate = customerDate;
	}

	public String getCustomerCheck() {
		return customerCheck;
	}

	public void setCustomerCheck(String customerCheck) {
		this.customerCheck = customerCheck;
	}

	public String getCustomer_check() {
		return customer_check;
	}

	public void setCustomer_check(String customer_check) {
		this.customer_check = customer_check;
	}

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

}
