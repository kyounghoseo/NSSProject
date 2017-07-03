package com.nss.manager.salesservice;

import java.util.List;

import com.nss.manager.ordervo.OrderVO;

public interface SalesService {

	public List<OrderVO> salesList(OrderVO ovo);

	public int salesTotalCnt(OrderVO ovo);
	
	public int salesTotalMoney(OrderVO ovo);
	
	public int salesRefundMoney(OrderVO ovo);
	
	public List<OrderVO> chartList(OrderVO ovo);
}
