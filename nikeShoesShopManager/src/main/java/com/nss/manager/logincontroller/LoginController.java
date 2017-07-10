package com.nss.manager.logincontroller;



import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nss.manager.loginservice.LoginService;
import com.nss.manager.loginvo.LoginVO;




@Controller
@RequestMapping(value="/login")
public class LoginController {

	Logger logger = Logger.getLogger(LoginController.class);

	@Autowired
	private LoginService loginService;
	
	@RequestMapping(value = "/loginForm")
	public String loginForm() {

		System.out.println("loginForm 드러오니");

		return "manager/login/loginForm";

	}
	

	@RequestMapping(value="/loginCheck")
	public ModelAndView loginCheck(@ModelAttribute LoginVO lvo ,HttpSession session){
		ModelAndView mv = new ModelAndView();
		System.out.println("로그인아이디"+lvo.getLoginManagerID());
		System.out.println("로그인패스워드"+lvo.getLoginManagerPW());
		LoginVO login = new LoginVO();
		if(lvo.getLoginManagerID()!=null ){
			System.out.println("로그인서비스들어가낭");
			login = loginService.loginConfirm(lvo);
			
			if(login.getManagerPW().equals(lvo.getLoginManagerPW())){
				System.out.println("패스워드"+login.getManagerPW());
				session.setAttribute("managerid", login.getManagerID());
				mv.setViewName("redirect:/order/orderList.do");
			}else{
				mv.setViewName("/manager/login/loginForm");
				mv.addObject("msg","failure");
			}
		}
		
		return mv;
		
	}
	
	
	
	
	@RequestMapping(value = "/logOut")
	public String loginOut(HttpSession session) {

		System.out.println("loginOut 드러오니");
		
		session.invalidate();

		return "redirect:/login/loginForm.do";

	}
	

}
