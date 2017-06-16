package com.nss.manager.ordercontroller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nss.manager.common.Paging;
import com.nss.manager.common.Util;
import com.nss.manager.loginservice.LoginService;
import com.nss.manager.loginvo.LoginVO;
import com.nss.manager.orderservice.OrderService;
import com.nss.manager.ordervo.OrderVO;

@Controller
@RequestMapping(value="/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private LoginService loginService;

	@RequestMapping(value="/orderList")
	public String orderList(@ModelAttribute LoginVO lvo , @ModelAttribute OrderVO ovo, Model model,HttpSession session ){
		System.out.println("로그인아이디"+lvo.getLoginManagerID());
		System.out.println("로그인패스워드"+lvo.getLoginManagerPW());
		LoginVO login = new LoginVO();
		if(lvo.getLoginManagerID()!=null ){
			System.out.println("로그인서비스들어가낭");
			login = loginService.loginConfirm(lvo);
			
			if(login.getManagerPW().equals(lvo.getLoginManagerPW())){
				System.out.println("패스워드"+login.getManagerPW());
				session.setAttribute("managerid", login.getManagerID());
			}
		}
		
		
		System.out.println(ovo.getS_startDate()+"스타트");
		System.out.println(ovo.getS_endDate()+"엔드");
		System.out.println("오더리스트");
		System.out.println(ovo.getOrder_check()+"ㅊㅔ크");
		Paging.setPage(ovo);
		int total = orderService.orderListCnt(ovo);
		System.out.println("total=" + total);
		int count = total - (Util.nvl(ovo.getPage()) - 1) * Util.nvl(ovo.getPageSize());
		System.out.println("count=" + count);
		
		
		List<OrderVO> order  = orderService.orderList(ovo);
		System.out.println(order.toString()+"오더 투 스트링~");
		
		int orderCount = orderService.orderCount(ovo);
		System.out.println(orderCount+"오더카운트");
		
		int shipCount = orderService.shipCount(ovo);
		System.out.println(shipCount+"shipCount");
		
		int cancleCount = orderService.cancleCount(ovo);
		System.out.println(cancleCount+"cancleCount");
		
	
		
		System.out.println(order.toString());
		model.addAttribute("orderList", order);
		model.addAttribute("orderCount", orderCount);
		model.addAttribute("shipCount",shipCount);
		model.addAttribute("cancleCount",cancleCount);
		model.addAttribute("count", count);
		model.addAttribute("data", ovo);
		model.addAttribute("total", total);
		
		return "manager/order/orderList";
		
	}
	

	@RequestMapping(value="/orderInfo")
	public String orderInfo(@ModelAttribute OrderVO ovo, Model model ){
		System.out.println(ovo.getOrder_check());
		System.out.println("오더인포");
		int result=0;
		String url = "";
		System.out.println(ovo.getOrderNO());
		result  = orderService.orderUpdate(ovo);
		
		if(result ==1){
			url = "/order/orderList.do";
		}
		model.addAttribute("order_check",ovo.getOrder_check());
		model.addAttribute("s_startDate", ovo.getS_startDate());
		model.addAttribute("s_endDate",ovo.getS_endDate());
		return "redirect:"+url;
		
	}
}
