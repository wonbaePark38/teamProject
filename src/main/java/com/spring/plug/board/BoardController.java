package com.spring.plug.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

@Controller
@SessionAttributes("board") //board라는 값을 세션에 저장해주라는 의미
public class BoardController {
	@Autowired
	private BoardService boardService;

	@ModelAttribute("conditionMap")
	public Map<String,String> searchConditionMap(){
		Map<String,String> conditionMap = new HashMap<String,String>();
		conditionMap.put("제목","TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo) throws IOException{
		System.out.println("글 등록처리");
		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();//사용자가 올린 파일 이름
			uploadFile.transferTo(new File("c:/myproject/" + fileName));
		}
		boardService.insertBoard(vo);


		return "getBoardList.do";
	}

	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board")BoardVO vo) {

		boardService.updateBoard(vo);

		return "getBoardList.do";
	}
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		System.out.println("서블릿 글 삭제처리");

		boardService.deleteBoard(vo);
		return "getBoardList.do";
	}
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model) {
		System.out.println("서블릿 글 상세보기 처리");

		BoardVO board =boardService.getBoard(vo);

		model.addAttribute("board",board);//키값 밸류
		return "getBoard.jsp";
	}
	@RequestMapping("/getBoardList.do")
	public String getBoardList(
			//@RequestParam(value="searchCondition", defaultValue = "TITLE", required = false)String condition,
			//@RequestParam(value="searchkeyword", defaultValue = "", required = false)String keyword,
			BoardVO vo, Model model) {

		if(vo.getSearchCondition() == null) {
			vo.setSearchCondition("TITLE");
		}

		if(vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		System.out.println("글 목록 검색 처리");
		System.out.println("검색 조건 : " + vo.getSearchCondition());
		System.out.println("검색 단어 : " + vo.getSearchKeyword());
		List<BoardVO> boardList = boardService.getBoardList(vo);

		//3 화면 네비
		model.addAttribute("boardList", boardList);
		return "getBoardList.jsp";
	}
	/*@RequestMapping("/dataTransform.do")
	@ResponseBody
	public BoardListVO dataTransform(BoardVO vo){
		vo.setSearchCondition("TITLE");
		vo.setSearchKeyword("");
		List<BoardVO> boardList = boardService.getBoardList(vo);

		BoardListVO boardListVO = new BoardListVO();
		boardListVO.setBoardList(boardList);
		return boardListVO;
	}*/
}
