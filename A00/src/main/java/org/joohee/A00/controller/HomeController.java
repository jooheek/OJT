package org.joohee.A00.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.ResultMap;
import org.joohee.A00.Service.BoardService;
import org.joohee.A00.VO.BoardVO;
import org.joohee.A00.VO.Criteria;
import org.joohee.A00.VO.PageMaker;
import org.joohee.A00.VO.SearchCriteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 */
@RestController
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@GetMapping(value = "/board")
	public ModelAndView list(@ModelAttribute("scri")SearchCriteria scri) throws Exception{
		
		logger.info("getList");

		ModelAndView mav = new ModelAndView();
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.countBoardList(scri));
		
		List<Map<String, Object>> listB = boardService.getList(scri);
		mav.addObject("listB",listB);
		mav.addObject("pageMaker",pageMaker);
		
		return mav;
	}
	//map형식으로 데이터를 보낸다면 pageMaker 데이터는 어떻게 보낼것인가??
	//ajax pagination????
	//검색은???
	


	//작성화면
	@GetMapping(value ="/writeView")
	public String insertView()throws Exception{
		
		logger.info("writeView");
		
		return "writeView";
	}
	
	//작성
	@PostMapping(value="/write")
	public String insert(BoardVO vo)throws Exception{
		
		logger.info("write");
		
		boardService.write(vo);
		
		return "redirect:/board";
		
	}
	
	
	  @GetMapping(value ="/board/get")
	  public String read(@RequestParam("projectCode")int projectCode,Model model,BoardVO  vo)throws Exception {
	  
		  logger.info("read");
		  
		  model.addAttribute("board",boardService.read(vo.getProjectCode()));
		  
		  return "view";
	  
	  } //requestparam 삭제
	 
	

	@PostMapping(value ="/board/update")
	public String update(@ModelAttribute Map<String, Object>map,HttpServletRequest request,HttpServletResponse response)throws Exception{

		logger.info("update");
		logger.debug("param : "+ map);
		
		//model.addAttribute("listB",boardService.getList(scri));
		//boardService.update(vo);
	
		return "a";
		
	}
	
	//update에 반영되는 criteria ?? SearchCriteria 파라미터를 받아와야하는 이유-> update 후 바로l  값을 넘겨주기 떄문
	
	@PostMapping(value ="/board/delete")
	public String delete(BoardVO vo,Criteria cri,RedirectAttributes rttr)throws Exception {
		
		logger.info("delete");
		
		boardService.delete(vo.getProjectCode());
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		
		return "redirect:/board";
		
	}

}
































