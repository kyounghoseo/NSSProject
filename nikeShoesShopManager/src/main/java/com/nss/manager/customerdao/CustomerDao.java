package com.nss.manager.customerdao;

import java.util.List;

import com.nss.manager.customervo.CustomerVO;


public interface CustomerDao {
	public List<CustomerVO> customerList(CustomerVO cvo);
	
	public int customerTotalCnt(CustomerVO cvo);
	
	public int customerTodayCnt(CustomerVO cvo);
	
}
