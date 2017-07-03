package com.nss.manager.salescontroller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nss.manager.common.Paging;
import com.nss.manager.ordervo.OrderVO;
import com.nss.manager.salesexcel.ListExcelView;
import com.nss.manager.salesservice.SalesService;

@Controller
@RequestMapping(value = "/sales")
public class SalesController {

	Logger logger = Logger.getLogger(SalesController.class);

	@Autowired
	private SalesService salesService;

	@RequestMapping(value = "/salesList", method = RequestMethod.GET)
	public String salesList(@ModelAttribute OrderVO ovo, Model model) {
		logger.info("salesList 호출성공");
		System.out.println("키워드 : " + ovo.getKeyword());
		System.out.println("서치값 : " + ovo.getSearch());
		System.out.println("매출체크 : " + ovo.getSales_check());

		// 매출 목록 개수
		int total = salesService.salesTotalCnt(ovo);

		// 매출, 환불 총 금액
		int totalMoney = salesService.salesTotalMoney(ovo);
		int refundMoney = salesService.salesRefundMoney(ovo);

		Paging.setPage(ovo);

		List<OrderVO> salesList = salesService.salesList(ovo);
		List<OrderVO> chartList = salesService.chartList(ovo);

		System.out.println("toString :" + chartList.toString());
		System.out.println("시작날짜 : " + ovo.getS_startDate());
		System.out.println("종료날짜 : " + ovo.getS_endDate());

		logger.info("total = " + total);

		model.addAttribute("salesList", salesList);
		model.addAttribute("total", total);
		model.addAttribute("totalMoney", totalMoney);
		model.addAttribute("refundMoney", refundMoney);
		model.addAttribute("chartList", chartList);
		model.addAttribute("data", ovo);

		System.out.println("salesList : " + salesList);

		return "manager/sales/salesList";
	}

	// 매출 엑셀 다운로드 구현
	@RequestMapping(value = "/salesExcel", method = RequestMethod.GET)
	public ModelAndView boardExcel(@ModelAttribute OrderVO ovo) {
		logger.info("salesExcel 호출 성공");

		Paging.setPage(ovo);

		List<OrderVO> salesList = salesService.salesList(ovo);

		ModelAndView mv = new ModelAndView(new ListExcelView());
		mv.addObject("list", salesList);
		mv.addObject("template", "sales.xlsx");
		mv.addObject("file_name", "sales");

		return mv;
	}

}
