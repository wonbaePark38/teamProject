package com.spring.plug.admin.qna.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.admin.qna.service.QnAService;
import com.spring.plug.admin.qna.vo.QnAVO;
import com.spring.plug.common.util.MailUtils;
import com.spring.plug.login.vo.UserVO;

@Controller
public class QnAController {

	@Autowired
	private QnAService qnaService;
	@Autowired
	private JavaMailSender mailSender;	
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		System.out.println("컨디션맵");
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("작성자", "WRITER");
		return conditionMap;
	}
	
	@RequestMapping(value = "/insertQnA.do")
	public String insertQnA(QnAVO vo, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		
		vo.setEmail(user.getEmail());
		vo.setWriter(user.getName());
		qnaService.insertBoard(vo);
		
		return "projectdir.do";
	}
	
	@RequestMapping(value = "/adminPage/production/qnaBoardList.do")
	public ModelAndView getBoardList(QnAVO vo, ModelAndView mav) {
		System.out.println("글 목록 검색 처리");
		if(vo.getSearchCondition() == null)	vo.setSearchCondition("TITLE");
		if(vo.getSearchKeyword() == null)	vo.setSearchKeyword("");
		List<QnAVO> boardList = qnaService.getBoardList(vo);
		mav.addObject("boardList", boardList);
		mav.setViewName("admin-CS-QA.jsp");
		return mav;
	}
	
	@RequestMapping("/adminPage/production/getBoard.do")
	public ModelAndView getBoard(QnAVO vo, ModelAndView mav) {
		System.out.println("글 상세 보기 처리");
		QnAVO board = qnaService.getBoard(vo);
		mav.addObject("board", board);
		mav.setViewName("admin-CS-board.jsp");
		return mav;
	}
	
	@RequestMapping("/adminPage/production/qnaReply.do")
	public ModelAndView replyBoard(QnAVO vo, ModelAndView mav) throws Exception {
		
		MailUtils sendMail = new MailUtils(mailSender);
		
		sendMail.setSubject("[답변 완료] " + vo.getTitle());
		sendMail.setText(new StringBuffer()
				.append("<p> 문의 내용 : <br>" + vo.getContent() +  " </p>")
				.append("<hr>")
				.append("<p> 답변 내용 : <br>" + vo.getReplycontent() +  " </p>")
				.toString());
		sendMail.setFrom("admin@wkddnjswhd.com", "원종띠");
		sendMail.setTo(vo.getEmail());
		sendMail.send();
		qnaService.updateBoard(vo);
		mav.setViewName("qnaBoardList.do");
		return mav;
	}
}
