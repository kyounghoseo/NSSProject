package com.nss.manager.logincontroller;



import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping(value="/login")
public class LoginController {

	Logger logger = Logger.getLogger(LoginController.class);

	
	@RequestMapping(value = "/loginForm")
	public String loginForm() {

		System.out.println("loginForm 드러오니");

		return "manager/login/loginForm";

	}
	

}
