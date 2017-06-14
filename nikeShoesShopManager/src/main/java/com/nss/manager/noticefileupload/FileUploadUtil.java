package com.nss.manager.noticefileupload;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	static Logger logger = Logger.getLogger(FileUploadUtil.class);

	public static String fileUpload(MultipartFile file, HttpServletRequest request) throws IOException {
		logger.info("fileUpload 호출 성공");

		String real_name = null;
		String org_name = file.getOriginalFilename();
		logger.info("org_name : " + org_name);

		// 파일명 변경
		if (org_name != null && (!org_name.equals(""))) {
			real_name = "notice_" + System.currentTimeMillis() + "_" + org_name;

			String docRoot = request.getSession().getServletContext().getRealPath("/noticeStorage");

			File fileDir = new File(docRoot);
			if (!fileDir.exists()) {
				fileDir.mkdir(); // 폴더 생성
			}

			File fileAdd = new File(docRoot + "/" + real_name);
			logger.info(fileAdd);

			file.transferTo(fileAdd);
		}
		return real_name;
	}

	public static void fileDelete(String fileName, HttpServletRequest request) throws IOException {
		logger.info("fileDelete 호출 성공");
		boolean result = false;
		String docRoot = request.getSession().getServletContext().getRealPath("/noticeStorage");

		File fileDelete = new File(docRoot + "/" + fileName);
		logger.info(fileDelete);

		if (fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
		}
		logger.info(result);
	}
}
