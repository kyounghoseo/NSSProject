package com.nss.manager.customercontroller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nss.manager.common.Paging;
import com.nss.manager.customerservice.CustomerService;
import com.nss.manager.customervo.CustomerVO;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
	Logger logger = Logger.getLogger(CustomerController.class);

	@Autowired
	private CustomerService customerService;

	@RequestMapping(value = "/customerList", method = RequestMethod.GET)
	public String customerList(@ModelAttribute CustomerVO cvo, Model model) {
		logger.info("customerList 호출 성공");

		System.out.println("customerList 호출 성공");
		System.out.println(cvo.getKeyword());
		System.out.println(cvo.getSearch());
		System.out.println(cvo.getCustomer_check());

		int totalCustomer = customerService.customerTotalCnt(cvo);
		int todayCustomer = customerService.customerTodayCnt(cvo);
		
		Paging.setPage(cvo);

		List<CustomerVO> customerList = customerService.customerList(cvo);

		model.addAttribute("customerList", customerList);
		model.addAttribute("totalCustomer", totalCustomer);
		model.addAttribute("todayCustomer", todayCustomer);
		model.addAttribute("data", cvo);

		return "manager/customer/customerList";
	}
}
