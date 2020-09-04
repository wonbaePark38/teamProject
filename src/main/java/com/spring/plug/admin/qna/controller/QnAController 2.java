package com.spring.plug.admin.qna.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.plug.admin.qna.service.QnAService;
import com.spring.plug.admin.qna.vo.QnAVO;

@Controller
public class QnAController {

	@Autowired
	private QnAService qnaService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("작성자", "WRITER");
		return conditionMap;
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
	public ModelAndView replyBoard(QnAVO vo, ModelAndView mav) {
		System.out.println(vo.getEmail());
		System.out.println(vo.getContent());
		System.out.println(vo.getTitle());
		
		mav.setViewName("admin-CS-board.jsp");
		return mav;
	}
}
