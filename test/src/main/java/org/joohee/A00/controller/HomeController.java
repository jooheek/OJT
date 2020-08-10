package org.joohee.A00.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.joohee.A00.Service.BoardService;
import org.joohee.A00.VO.BoardVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/board/*")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list( Model model) throws Exception{

		Map<String,Object>map = new HashMap<String,Object>();
		List<?>list = boardService.getList(map);
		
		model.addAttribute("getList",list);
		
		return "home";
	}
	
	
	@RequestMapping(value="/board/insertView",method =RequestMethod.GET)
	public String write(BoardVO vo)throws Exception {
		
		return "insertView";
		
	}
	
}
