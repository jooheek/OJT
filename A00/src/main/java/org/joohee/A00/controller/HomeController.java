package org.joohee.A00.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.joohee.A00.Service.BoardService;
import org.joohee.A00.VO.BoardVO;
import org.joohee.A00.VO.Criteria;
import org.joohee.A00.VO.PageMaker;
import org.joohee.A00.VO.SearchCriteria;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/board")
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
	

	//작성화면
	@RequestMapping(value="/writeView",method = RequestMethod.GET)
	public String insertView()throws Exception{
		
		logger.info("writeView");
		
		return "writeView";
	}
	
	//작성
	@RequestMapping(value="/write",method=RequestMethod.POST)
	public String insert(BoardVO vo)throws Exception{
		
		logger.info("write");
		
		boardService.write(vo);
		
		return "redirect:/board";
		
	}
	
	@RequestMapping(value="/board/get",method=RequestMethod.GET)
	public String read(@RequestParam("projectCode")int projectCode,Model model,BoardVO vo)throws Exception {
		
		logger.info("read");
		
		model.addAttribute("board",boardService.read(vo.getProjectCode()));
		
		return "view";
		
	}
	//requestparam 삭제
	
	@RequestMapping(value="/board/update",method=RequestMethod.POST)
	public String update(BoardVO vo,Model model,Criteria cri,@ModelAttribute("scri")SearchCriteria scri)throws Exception{
		logger.info("update");
		
		model.addAttribute("listB",boardService.getList(scri));
		boardService.update(vo);

		return "redirect:/board";
		
	}
	
	//update에 반영되는 criteria ?? SearchCriteria 파라미터를 받아와야하는 이유-> update 후 바로  값을 넘겨주기 떄문
	
	@RequestMapping(value="/board/delete",method=RequestMethod.POST)
	public String delete(BoardVO vo,Criteria cri,RedirectAttributes rttr)throws Exception {
		
		logger.info("delete");
		
		boardService.delete(vo.getProjectCode());
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		
		return "redirect:/board";
		
	}
	
}
