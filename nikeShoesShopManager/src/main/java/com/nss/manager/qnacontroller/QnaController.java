package com.nss.manager.qnacontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nss.manager.productfileupload.FileUploadUtil;
import com.nss.manager.productvo.ProductVO;
import com.nss.manager.qnaservice.QnaService;
import com.nss.manager.qnavo.QnaVO;

@Controller
@RequestMapping(value = "/qna")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	
	
	
	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public String qnaList(@ModelAttribute QnaVO qvo, Model model) {



		List<QnaVO> qnaList = qnaService.qnaList(qvo);


		model.addAttribute("qnaList", qnaList);


		return "manager/qna/qnaList";

	}

	

	@RequestMapping(value = "/qnaDetail", method = RequestMethod.GET)
	public String qnaDetail(@ModelAttribute QnaVO qvo, Model model) {
		System.out.println("디테일~~!!qna");


		QnaVO detail = new QnaVO();
		detail = qnaService.qnaDetail(qvo);
	

		model.addAttribute("detail", detail);

		return "manager/qna/qnaDetail";
	}
	
	
	
	@RequestMapping(value = "/qnaDelete" ,method = RequestMethod.POST)
	public String qnaDelete(@ModelAttribute QnaVO qvo, HttpServletRequest request) throws IOException {

		System.out.println("딜리트넘버" + qvo.getQnaNO());

		int result = 0;
		String url = "";

		result = qnaService.qnaDelete(qvo.getQnaNO());
		System.out.println(result);
		if (result == 1) {
			url = "/qna/qnaList.do";
		}
		return "redirect:" + url;

	}
	
	@RequestMapping(value = "/qnaUpdate" ,method = RequestMethod.POST)
	public String qnaUpdate(@ModelAttribute QnaVO qvo, HttpServletRequest request) throws IOException {

		System.out.println("업" + qvo.getQnaNO());

		int result = 0;
		String url = "";

		result = qnaService.qnaDelete(qvo.getQnaNO());
		System.out.println(result);
		if (result == 1) {
			url = "/qna/qnaList.do";
		}
		return "redirect:" + url;

	}
}
