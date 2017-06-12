package com.nss.manager.noticecontroller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nss.manager.noticeservice.NoticeService;
import com.nss.manager.noticevo.NoticeVO;

@Controller
@RequestMapping(value = "/notice")
public class NoticeController {
	Logger logger = Logger.getLogger(NoticeController.class);

	@Autowired
	private NoticeService noticeService;

	public String noticeList(@ModelAttribute NoticeVO nvo, Model model) {
		logger.info("noticeList 호출성공");

		List<NoticeVO> noticeList = noticeService.noticeList(nvo);

		model.addAttribute("noticeList", noticeList);
		model.addAttribute("data", nvo);

		return "manager/notice/noticeList";

	}

}
