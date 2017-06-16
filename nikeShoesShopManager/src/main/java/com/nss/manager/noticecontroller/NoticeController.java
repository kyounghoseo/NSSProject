package com.nss.manager.noticecontroller;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nss.manager.common.Paging;
import com.nss.manager.noticefileupload.FileUploadUtil;
import com.nss.manager.noticeservice.NoticeService;
import com.nss.manager.noticevo.NoticeVO;

@Controller
@RequestMapping(value = "/notice")
public class NoticeController {
	Logger logger = Logger.getLogger(NoticeController.class);

	@Autowired
	private NoticeService noticeService;

	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(@ModelAttribute NoticeVO nvo, Model model) {
		logger.info("noticeList 호출성공");

		Paging.setPage(nvo);

		int total = noticeService.noticeListCnt(nvo);

		List<NoticeVO> noticeList = noticeService.noticeList(nvo);

		logger.info("total = " + total);

		model.addAttribute("noticeList", noticeList);
		model.addAttribute("total", total);
		model.addAttribute("data", nvo);

		System.out.println("noticeList : " + noticeList);

		return "manager/notice/noticeList";

	}

	@RequestMapping(value = "/insertForm")
	public String insertForm(HttpSession session) {
		logger.info("insertForm 호출!");

		session.setAttribute("CSRF_TOKEN", UUID.randomUUID().toString());
		logger.info("CSRF_TOKEN : " + UUID.randomUUID().toString());

		return "manager/notice/noticeInsert";

	}

	// 글쓰기 구현
	@RequestMapping(value = "/noticeInsert", method = RequestMethod.POST)
	public String noticeInsert(@ModelAttribute NoticeVO nvo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		logger.info("boardInsert 호출 성공");
		logger.info("fileName : " + nvo.getFile().getOriginalFilename());
		logger.info("noticeFile : " + nvo.getNoticeFile());
		logger.info("managerNo : " + nvo.getManagerNo());

		int result = 0;
		String url = "";

		String noticeFile = FileUploadUtil.fileUpload(nvo.getFile(), request);
		nvo.setNoticeFile(noticeFile);

		result = noticeService.noticeInsert(nvo);
		logger.info("result : " + result);

		if (result == 1) {
			url = "/notice/noticeList.do";
		}

		return "redirect:" + url;
	}

	@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(@ModelAttribute NoticeVO nvo, Model model) {

		logger.info("notice 상세페이지 호출!");

		logger.info("NoticeNo : " + nvo.getNoticeNo());

		NoticeVO detail = new NoticeVO();
		detail = noticeService.noticeDetail(nvo);

		if (detail != null && (!detail.equals(""))) {
			detail.setNoticeContents(detail.getNoticeContents().toString().replaceAll("\n", "<br>"));
		}

		model.addAttribute("detail", detail);

		return "manager/notice/noticeDetail";
	}

	@RequestMapping(value = "/updateForm", method = RequestMethod.POST)
	public String updateForm(@ModelAttribute NoticeVO nvo, Model model) {
		logger.info("updateForm 호출!");

		NoticeVO updateData = new NoticeVO();
		updateData = noticeService.noticeDetail(nvo);

		model.addAttribute("updateData", updateData);

		return "manager/notice/noticeUpdate";

	}

	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.POST)
	public String noticeUpdate(@ModelAttribute NoticeVO nvo, HttpServletRequest request)
			throws IllegalStateException, IOException {
		logger.info("noticeUpdate 호출 성공");

		int result = 0;
		String url = "";
		String noticeFile = "";

		System.out.println("noticeNo : " + nvo.getNoticeNo());
		System.out.println("page : " + nvo.getPage());
		System.out.println("pageSize : " + nvo.getPageSize());

		if (!nvo.getFile().isEmpty()) {
			logger.info("============noticefile = " + nvo.getNoticeFile());
			FileUploadUtil.fileDelete(nvo.getNoticeFile(), request);
			noticeFile = FileUploadUtil.fileUpload(nvo.getFile(), request);
			nvo.setNoticeFile(noticeFile);
		} else {
			logger.info("첨부파일 없음");
			nvo.setNoticeFile("");
		}

		logger.info("===========noticeFile = " + nvo.getNoticeFile());
		result = noticeService.noticeUpdate(nvo);

		if (result == 1) {
			url = "/notice/noticeDetail.do?noticeNo=" + nvo.getNoticeNo() + "&page=" + nvo.getPage() + "&pageSize="
					+ nvo.getPageSize();
		}

		return "redirect:" + url;
	}

	@RequestMapping(value = "/noticeDelete", method = RequestMethod.POST)
	public String noticeDelete(@ModelAttribute NoticeVO nvo, HttpServletRequest request) throws IOException {
		logger.info("noticeDelete 호출 성공");

		int result = 0;
		String url = "";

		FileUploadUtil.fileDelete(nvo.getNoticeFile(), request);
		result = noticeService.noticeDelete(nvo.getNoticeNo());

		if (result == 1) {
			url = "/notice/noticeList.do"; // 삭제후 목록
		}

		return "redirect:" + url;
	}

}
