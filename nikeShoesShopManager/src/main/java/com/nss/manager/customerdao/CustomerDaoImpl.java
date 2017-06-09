package com.nss.manager.customerdao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nss.manager.customervo.CustomerVO;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<CustomerVO> customerList(CustomerVO cvo) {
		// TODO Auto-generated method stub
		return session.selectList("customerList", cvo);
	}

	@Override
	public int customerTotalCnt(CustomerVO cvo) {
		// TODO Auto-generated method stub
		return (Integer) session.selectOne("customerTotalCnt", cvo);
	}

	@Override
	public int customerTodayCnt(CustomerVO cvo) {
		// TODO Auto-generated method stub
		return (Integer) session.selectOne("customerTodayCnt", cvo);
	}

}
