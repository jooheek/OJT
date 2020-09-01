/**
 * 
 */
package org.joohee.A00.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.joohee.A00.Service.BoardService;
import org.joohee.A00.VO.BoardVO;
import org.joohee.A00.dto.BoardDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author USER
 *
 */
@Controller
@RequestMapping(value = "/board")
public class AjaxController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Resource(name = "boardService")
	private BoardService boardService;

	// 게시판 목록페이지 이동
	@RequestMapping(value = "/boardList")
	public String getBoardList() throws Exception {
		
		return "boardList";
	}
	


	// 게시판 목록 조회
	@RequestMapping(value = "/getBoardList",method = RequestMethod.POST)
	@ResponseBody
	public List<BoardDTO> getboardList(BoardVO boardVO)throws Exception {
		logger.info("==============getBoardListTest====================");
		List<BoardDTO> boardDtoList = boardService.getBoardList(boardVO);
		
		return boardDtoList;
	}
	//ajax는 무조건 데이터를 객체로 받는다. 

	// 게시판 상세페이지 이동
	@RequestMapping(value = "/boardDetail")
	public String boardDetail() throws Exception {

		return "boardDetail";
	}

	// 게시판 상세 조회
	@RequestMapping(value = "/getBoardDetail/{projectCode}",method = RequestMethod.POST)
	@ResponseBody
	public BoardDTO getBoardDetail(@PathVariable("projectCode")int projectCode,BoardVO boardVO)throws Exception {
		
		logger.info("============getBoardDetailTest====================");
		 logger.info("projectCode : "+projectCode);
		logger.info(boardVO.toString());
		
		BoardDTO boardDTO = boardService.getBoardDetail(projectCode);
		
		return boardDTO;
	}

	// 게시판 작성 페이지 이동
	@RequestMapping(value = "/boardWrite")
	public String boardWrite() throws Exception {

		return "boardWrite";
	}

	
	 //게시글 등록
	 @RequestMapping(value="/insertBoard",method = RequestMethod.POST)
	 @ResponseBody 
	 public BoardDTO insertBoard(@RequestBody BoardVO boardVO)throws Exception {
		 
		 logger.info("=====================insertBoard=================================");
		 logger.debug(boardVO.toString());
		 
		 BoardDTO boardDTO = boardService.insertBoard(boardVO);
	  
		 return boardDTO;
	 }
	 //requestbody boardvo 사용해서 데이터 넘길것
	 
	 //게시글 삭제
	 @RequestMapping(value="/deleteBoard",method = RequestMethod.POST)
	 @ResponseBody
	 public BoardDTO deleteBoard(@PathVariable("projectCode")int projectCode, BoardVO boardVO) throws Exception{
	
		 BoardDTO boardDTO = boardService.deleteBoard(boardVO);
		 
		return boardDTO;
	 }
	 
	 //게시판 수정 페이지로 이동
	 @RequestMapping(value="/boardUpdate")
	 public String boardUpdate() throws Exception{

		 return "boardUpdate";
	 }
	 
	 //게시글 수정
	 @RequestMapping(value="/updateBoard",method = RequestMethod.POST)
	 @ResponseBody
	 public BoardDTO updateBoard(@PathVariable("projectCode")int projectCode,BoardVO boardVO) throws Exception{
		 
		 logger.info("updateBoard");
		 
		 BoardDTO boardDTO = boardService.updateBoard(boardVO);
		 
		 return boardDTO;
	 }
	 
}
