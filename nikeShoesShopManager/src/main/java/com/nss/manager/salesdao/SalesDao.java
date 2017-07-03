package com.nss.manager.salesdao;

import java.util.List;

import com.nss.manager.ordervo.OrderVO;

public interface SalesDao {

	public List<OrderVO> salesList(OrderVO ovo);

	public int salesTotalCnt(OrderVO ovo);
	
	public int salesTotalMoney(OrderVO ovo);
	
	public int salesRefundMoney(OrderVO ovo);
	
	public List<OrderVO> chartList(OrderVO ovo);
	
	public List<OrderVO> chartMonth(OrderVO ovo);
}
