/**
 * 
 */
package org.joohee.A00.Service;

import java.util.List;
import java.util.Map;

import org.joohee.A00.VO.BoardVO;
import org.joohee.A00.VO.SearchCriteria;
import org.joohee.A00.dto.BoardDTO;
import org.springframework.stereotype.Service;


/**
 * @author jooheek
 *
 */
@Service
public interface BoardService {
	
	
	public List<Map<String,Object>> getList(SearchCriteria scri);

	public BoardVO read(int projectCode);
	
	public void delete(int projectCode);
	
	public void write(BoardVO vo)throws Exception;

	public void update(BoardVO vo)throws Exception;
	
	public int countBoardList(SearchCriteria scri)throws Exception;
	
	//ajax controller

	public List<BoardDTO> getBoardList(BoardVO boardVO);
	
	public BoardDTO getBoardDetail(int projectCode);

	public BoardDTO insertBoard(BoardVO boardVO);

	public BoardDTO deleteBoard(BoardVO boardVO);

	public BoardDTO updateBoard(BoardVO boardVO);
	
	public int getBoardCnt()throws Exception;
	
}
