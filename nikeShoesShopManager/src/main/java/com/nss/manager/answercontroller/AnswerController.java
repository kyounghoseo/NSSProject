package com.nss.manager.answercontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.nss.manager.answerservice.AnswerService;
import com.nss.manager.answervo.AnswerVO;

@RestController
@RequestMapping(value = "/answer")
public class AnswerController {

	
	@Autowired
	private AnswerService answerService;
	
	@RequestMapping(value = "/all/{qnaNO}.do", method = RequestMethod.GET)
	public ResponseEntity<List<AnswerVO>> list(@PathVariable("qnaNO") Integer qnaNO) {
		System.out.println("큐엔에이리스트");
		ResponseEntity<List<AnswerVO>> entity = null;

		try {

			entity = new ResponseEntity<>(answerService.answerList(qnaNO), HttpStatus.OK);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/answerInsert")
	public ResponseEntity<String> replyInsert(@RequestBody AnswerVO avo) {
		System.out.println("insert 호출 성공");
		ResponseEntity<String> entity = null;
		int result;
		avo.setManagerNO("1");
		try {
			result = answerService.answerInsert(avo);
			if (result == 1) {
				entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		System.out.println(entity);
		return entity;
	}

	@RequestMapping(value = "/{answerNO}.do", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> replyUpdate(@PathVariable("answerNO") Integer answerNO, @RequestBody AnswerVO avo) {
		ResponseEntity<String> entity = null;
		System.out.println("업데이트");
		System.out.println(answerNO+"엔설넘버");
		System.out.println(avo.getAnswerContents()+"콘텐츠");

		try {
			avo.setAnswerNO(answerNO);
			answerService.answerUpdate(avo);
			System.out.println(avo.getAnswerContents());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;

	}

	@RequestMapping(value = "/{answerNO}.do", method = RequestMethod.DELETE)
	public ResponseEntity<String> replyDelete(@PathVariable("answerNO") Integer answerNO) {
		ResponseEntity<String> entity = null;

		try {
			answerService.answerDelete(answerNO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;

	}
}
