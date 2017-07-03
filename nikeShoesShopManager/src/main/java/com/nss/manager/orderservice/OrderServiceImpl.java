package com.nss.manager.orderservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nss.manager.orderdao.OrderDao;
import com.nss.manager.ordervo.OrderVO;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;
	
	@Override
	public List<OrderVO> orderList(OrderVO ovo) {
		// TODO Auto-generated method stub
		return orderDao.orderList(ovo);
	}

	@Override
	public int orderUpdate(OrderVO ovo) {
		// TODO Auto-generated method stub
		int result = 0;
		result = orderDao.orderUpdate(ovo);
		System.out.println("result="+result);
		return result;
	}

	@Override
	public int orderCount(OrderVO ovo) {
		// TODO Auto-generated method stub
		int result = 0;
		result = orderDao.orderCount(ovo);
		
		return result;
	}

	@Override
	public int shipCount(OrderVO ovo) {
		// TODO Auto-generated method stub
		int result = 0;
		result = orderDao.shipCount(ovo);
		
		return result;
	}

	@Override
	public int cancleCount(OrderVO ovo) {
		// TODO Auto-generated method stub
		int result = 0;
		result = orderDao.cancleCount(ovo);
		
		return result;
	}

	@Override
	public int orderListCnt(OrderVO ovo) {
		// TODO Auto-generated method stub
		return orderDao.orderListCnt(ovo);
	}

}
