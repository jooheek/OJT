/**
 * 
 */
package org.joohee.A00.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.joohee.A00.Mapper.BoardMapper;
import org.joohee.A00.Service.BoardService;
import org.joohee.A00.VO.BoardVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author USER
 *
 */
@Controller
@RequestMapping(value="/board")
public class AjaxController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	//게시판 목록페이지 이동
	@RequestMapping(value="/boardList")
	public String getBoardList(HttpServletRequest request, HttpServletResponse response)throws Exception{
	
		return "boardList";
	}
	
	//게시판 목록 조회
	@RequestMapping(value="/getBoardList")
	@ResponseBody
	public List<BoardMapper> getboardList(HttpServletRequest request,HttpServletResponse response,BoardVO boardVO)throws Exception{
		
		List<BoardMapper> boardList = boardService.getBoardList(boardVO);
		
		return boardList;
	}
	
	//게시판 상세페이지 이동
	@RequestMapping(value ="/boardDetail")
	public String boardWrite(HttpServletRequest request,HttpServletResponse response)throws Exception{
		
		return "boardDetail";
	}

	//게시판 상세 조회
	@RequestMapping(value ="/getBoardDetail")
	@ResponseBody
	public BoardVO getBoardDetail(HttpServletRequest request, HttpServletResponse response,BoardVO boardVO)throws Exception{
		
		BoardMapper boardMapper = boardService.getBoardDetail(boardVO);
		return null;
	}
}
