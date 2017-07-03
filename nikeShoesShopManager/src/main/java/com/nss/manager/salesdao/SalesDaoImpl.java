package com.nss.manager.salesdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nss.manager.ordervo.OrderVO;

@Repository
public class SalesDaoImpl implements SalesDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<OrderVO> salesList(OrderVO ovo) {
		// TODO Auto-generated method stub
		return session.selectList("salesList", ovo);
	}

	@Override
	public int salesTotalCnt(OrderVO ovo) {
		// TODO Auto-generated method stub
		return session.selectOne("salesTotalCnt", ovo);
	}

	@Override
	public int salesTotalMoney(OrderVO ovo) {
		// TODO Auto-generated method stub
		return session.selectOne("salesTotalMoney", ovo);
	}

	@Override
	public int salesRefundMoney(OrderVO ovo) {
		// TODO Auto-generated method stub
		return session.selectOne("salesRefundMoney", ovo);
	}

	@Override
	public List<OrderVO> chartList(OrderVO ovo) {
		// TODO Auto-generated method stub
		return session.selectList("chartList", ovo);
	}

	@Override
	public List<OrderVO> chartMonth(OrderVO ovo) {
		// TODO Auto-generated method stub
		return session.selectList("chartMonth", ovo);
	}

}
