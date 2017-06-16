package com.nss.manager.logindao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nss.manager.loginvo.LoginVO;

@Repository
public class LoginDaoImpl implements LoginDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public LoginVO loginConfirm(LoginVO lvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("loginConfirm",lvo);
	}

}
