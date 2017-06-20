package com.nss.manager.salescontroller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nss.manager.common.Paging;
import com.nss.manager.noticevo.NoticeVO;
import com.nss.manager.ordervo.OrderVO;
import com.nss.manager.salesservice.SalesService;

@Controller
@RequestMapping(value = "/sales")
public class SalesController {

	Logger logger = Logger.getLogger(SalesController.class);

	@Autowired
	private SalesService salesService;

	@RequestMapping(value = "/salesList", method = RequestMethod.GET)
	public String salesList(@ModelAttribute OrderVO ovo, Model model) {
		logger.info("noticeList 호출성공");

		/* Paging.setPage(nvo); */

		/* int total = noticeService.noticeListCnt(nvo); */

		/*List<OrderVO> salesList = salesService.salesList(ovo);*/

		/* logger.info("total = " + total); */

		/*model.addAttribute("salesList", salesList);
		 model.addAttribute("total", total); 
		model.addAttribute("data", ovo);

		System.out.println("salesList : " + salesList);*/

		return "manager/sales/salesList";
	}

}
