/**
 * <PRE>
 *  Project : A001
 *  Package : org.jooheek.A001.service
 * </PRE>
 * @file   : BoardServiceImpl.java
 * @date   : 2020. 8. 7 오전 10:45:57
 * @author : NB-0308
 * @brief  :
 *  변경이력    : 
 *        이름     : 일자          : 근거자료   : 변경내용
 *       ------------------------------------
 *        NB-0308  : 2020. 8. 7       :            : 신규 개발.
 */
package org.joohee.A00.Service;

import java.util.List;
import java.util.Map;

import org.joohee.A00.Mapper.BoardMapper;
import org.joohee.A00.VO.BoardVO;
import org.joohee.A00.VO.SearchCriteria;
import org.joohee.A00.controller.HomeController;
import org.joohee.A00.dto.BoardDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <PRE>
 *  ClassName : BoardServiceImpl 
 * </PRE>
 * @version : 1.0
 * @date    : 2020. 8. 7 오전 10:45:57
 * @author  : NB-0308
 * @brief   : 
 */
@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private BoardMapper boardMapper;

	@Override
	public List<Map<String, Object>> getList(SearchCriteria scri) {
		
		return boardMapper.getList(scri);
	}

	@Override
	public BoardVO read(int projectCode) {
		return boardMapper.read(projectCode);
	}

	@Override
	public void delete(int projectCode) {

		boardMapper.delete(projectCode);
	}
 
	@Transactional(readOnly = false)
	@Override
	public void write(BoardVO vo) throws Exception {
		
		logger.info("write");
		logger.info(vo.toString());
		boardMapper.insertP(vo);
		logger.info(vo.toString());
		boardMapper.insertF(vo);
		 
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		
		boardMapper.update(vo);
	}

	@Override
	public int countBoardList(SearchCriteria scri) throws Exception{

		return boardMapper.countBoardList(scri);
	}
	//EXCEPTION적용안하면 오류나는 이유

	
	//ajax controller
	
	//게시판 조회
	@Override
	public List<BoardDTO> getBoardList(BoardVO boardVO) {

		return boardMapper.getBoardList(boardVO);
	}
	
	//게시판 상세조회
	@Override
	public BoardDTO getBoardDetail(BoardVO boardVO) {
		
		BoardDTO boardDTO = new BoardDTO();
		
		boardDTO = boardMapper.getBoardDetail(boardVO);
		
		return boardDTO;
	}
	
	//게시글 등록
	@Override 
	public BoardDTO insertBoard(BoardVO boardVO) {
		
		BoardDTO boardDTO = new BoardDTO();
		
		int insertCnt = boardMapper.insertBoard(boardVO);
		if(insertCnt>0) {
			boardDTO.setResult("success");
		}else {
			boardDTO.setResult("fail");
		}
	
		return boardDTO;
	}
	//int type을 반환해야하기 떄문에 insertCount를 매긴다
	
	//게시글 삭제
	@Override
	public BoardDTO deleteBoard(BoardVO boardVO) {
		
		BoardDTO boardDTO = new BoardDTO();
		
		int deletCnt = boardMapper.deleteBoard(boardVO);
		
		if(deletCnt >0) {
			boardDTO.setResult("success");
		}else {
			boardDTO.setResult("fail");
		}
		
		return boardDTO;
	}

	@Override
	public BoardDTO updateBoard(BoardVO boardVO) {
		
		BoardDTO boardDTO = new BoardDTO();
		
		int updateCnt = boardMapper.updateBoard(boardVO);
		
		if(updateCnt >0) {
			boardDTO.setResult("success");
		}else {
			boardDTO.setResult("fail");
		}
		
		return boardDTO;
	}
	 

}
