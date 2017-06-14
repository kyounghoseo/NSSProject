package com.nss.manager.orderservice;

import java.util.List;

import com.nss.manager.ordervo.OrderVO;

public interface OrderService {

	
	public List<OrderVO> orderList(OrderVO ovo);
	
	public int orderUpdate(OrderVO ovo);
	
	public int orderCount(OrderVO ovo);
	
	public int shipCount(OrderVO ovo);
	
	public int cancleCount(OrderVO ovo);
}
