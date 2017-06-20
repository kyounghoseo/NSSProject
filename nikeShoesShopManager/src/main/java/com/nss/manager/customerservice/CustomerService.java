package com.nss.manager.customerservice;

import java.util.List;

import com.nss.manager.customervo.CustomerVO;

public interface CustomerService {
	public List<CustomerVO> customerList(CustomerVO cvo);

	public int customerTotalCnt(CustomerVO cvo);

	public int customerTodayCnt(CustomerVO cvo);

}
