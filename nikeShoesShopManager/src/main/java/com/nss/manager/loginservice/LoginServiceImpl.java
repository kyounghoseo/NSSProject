package com.nss.manager.loginservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nss.manager.logindao.LoginDao;
import com.nss.manager.loginvo.LoginVO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginDao loginDao;
	
	@Override
	public LoginVO loginConfirm(LoginVO lvo) {
		// TODO Auto-generated method stub
		return loginDao.loginConfirm(lvo);
	}

}
