package org.joohee.A00.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.joohee.A00.Service.BoardService;
import org.joohee.A00.VO.BoardVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		List<Map<String,Object>>list = boardService.getList(map);
		
		model.addAttribute("getList",list);
		return "home";
	}
	
	/*
	 * @RequestMapping(value="/board/insert",method =RequestMethod.GET) public
	 * String insert(@ModelAttribute BoardVO vo)throws Exception {
	 * boardService.insert(vo);
	 * 
	 * return "redirect:/";
	 * 
	 * }
	 */
	
	//작성화면
	@RequestMapping(value="/board/writeView",method = RequestMethod.GET)
	public String insertView()throws Exception{
		
		logger.info("writeView");
		return "writeView";
	}
	
	//작성
	@RequestMapping(value="/board/write",method=RequestMethod.POST)
	public String insert(BoardVO vo)throws Exception{
		
		logger.info("write");
		
		boardService.write(vo);
		
		return "redirect:/";
		
	}
	
	@RequestMapping(value="/get",method=RequestMethod.GET)
	public String read(@RequestParam("projectCode")int projectCode,Model model )throws Exception {
		
		model.addAttribute("board",boardService.read(projectCode));
		
		return "view";
		
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update()throws Exception{
		return null;
		
	}
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String delete(@RequestParam("projectCode")int projectCode)throws Exception {
		
		boardService.delete(projectCode);
		
		return "redirect:/board/";
		
	}
	
}
