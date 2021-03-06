package com.nss.manager.salesservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nss.manager.ordervo.OrderVO;
import com.nss.manager.salesdao.SalesDao;

@Service
@Transactional
public class SalesServiceImpl implements SalesService {

	@Autowired
	private SalesDao salesDao;

	@Override
	public List<OrderVO> salesList(OrderVO ovo) {
		// TODO Auto-generated method stub

		List<OrderVO> saList = null;
		saList = salesDao.salesList(ovo);
		return saList;
	}

	@Override
	public int salesTotalCnt(OrderVO ovo) {
		// TODO Auto-generated method stub
		return salesDao.salesTotalCnt(ovo);
	}

	@Override
	public int salesTotalMoney(OrderVO ovo) {
		// TODO Auto-generated method stub
		return salesDao.salesTotalMoney(ovo);
	}

	@Override
	public int salesRefundMoney(OrderVO ovo) {
		// TODO Auto-generated method stub
		return salesDao.salesRefundMoney(ovo);
	}

	@Override
	public List<OrderVO> chartList(OrderVO ovo) {
		// TODO Auto-generated method stub
		return salesDao.chartList(ovo);
	}

	@Override
	public List<OrderVO> chartMonth(OrderVO ovo) {
		// TODO Auto-generated method stub
		return salesDao.chartMonth(ovo);
	}

}
