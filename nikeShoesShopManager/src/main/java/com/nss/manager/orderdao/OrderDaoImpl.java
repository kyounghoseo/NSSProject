package com.nss.manager.orderdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nss.manager.ordervo.OrderVO;

@Repository
public class OrderDaoImpl implements OrderDao{

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<OrderVO> orderList(OrderVO ovo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("orderList",ovo);
	}


	@Override
	public int orderUpdate(OrderVO ovo) {
		// TODO Auto-generated method stub
		System.out.println("다오의의넘버"+ovo.getOrderNO());
		return sqlSession.update("orderUpdate",ovo);
	}


	@Override
	public int orderCount(OrderVO ovo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("orderCount", ovo);
	}


	@Override
	public int shipCount(OrderVO ovo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shipCount", ovo);
	}


	@Override
	public int cancleCount(OrderVO ovo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cancleCount", ovo);
	}

}
