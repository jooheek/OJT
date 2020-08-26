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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String getBoardList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "boardList";
	}
	


	// 게시판 목록 조회
	@RequestMapping(value = "/getBoardList")
	@ResponseBody
	public List<BoardDTO> getboardList(HttpServletRequest request, HttpServletResponse response, BoardVO boardVO)throws Exception {
		
		logger.info(boardVO.toString());
		List<BoardDTO> boardDtoList = boardService.getBoardList(boardVO);
		
		return boardDtoList;
	}
	//ajax는 무조건 데이터를 객체로 받는다. 

	// 게시판 상세페이지 이동
	@RequestMapping(value = "/boardDetail")
	public String boardDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "boardDetail";
	}

	// 게시판 상세 조회
	@RequestMapping(value = "/getBoardDetail")
	@ResponseBody
	public BoardDTO getBoardDetail(HttpServletRequest request, HttpServletResponse response, BoardVO boardVO)throws Exception {

		BoardDTO boardDTO = boardService.getBoardDetail(boardVO);
		
		return boardDTO;
	}

	// 게시판 작성 페이지 이동
	@RequestMapping(value = "/boardWrite")
	public String boardWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "boardWrite";
	}

	
	 //게시글 등록
	 @RequestMapping(value="/insertBoard")
	 @ResponseBody 
	 public BoardDTO insertBoard(HttpServletRequest request,HttpServletResponse response, BoardVO boardVO)throws Exception {
	  
		 logger.debug(boardVO.toString());
		 BoardDTO boardDTO = boardService.insertBoard(boardVO);
	  
		 return boardDTO;
	 }
	 //requestbody boardvo 사용해서 데이터 넘길것
	 
	 //게시글 삭제
	 @RequestMapping(value="/deleteBoard")
	 @ResponseBody
	 public BoardDTO deleteBoard(HttpServletRequest request, HttpServletResponse response,BoardVO boardVO)throws Exception{
		 
		 BoardDTO boardDTO = boardService.deleteBoard(boardVO);
		 
		return boardDTO;
	 }
	 
	 //게시판 수정 페이지로 이동
	 @RequestMapping(value="/boardUpdate")
	 public String boardUpdate(HttpServletRequest request, HttpServletResponse response)throws Exception{

		 return "boardUpdate";
	 }
	 
	 //게시글 수정
	 @RequestMapping(value="/updateBoard")
	 @ResponseBody
	 public BoardDTO updateBoard(HttpServletRequest request, HttpServletResponse response,BoardVO boardVO)throws Exception{
		 
		 logger.info("updateBoard");
		 
		 BoardDTO boardDTO = boardService.updateBoard(boardVO);
		 
		 return boardDTO;
	 }
	 
	 
	 
	 
}
