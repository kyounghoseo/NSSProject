package com.nss.manager.orderdao;

import java.util.List;

import com.nss.manager.ordervo.OrderVO;

public interface OrderDao {

	
	public List<OrderVO> orderList(OrderVO ovo);
	
	public int orderUpdate(OrderVO ovo);
	
	public int orderCount(OrderVO ovo);
	
	public int shipCount(OrderVO ovo);
	
	public int cancleCount(OrderVO ovo);
	
	public int orderListCnt(OrderVO ovo);
}
