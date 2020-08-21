/**
 * 
 */
package org.joohee.A00.Service;

import java.util.List;
import java.util.Map;

import org.joohee.A00.Mapper.BoardMapper;
import org.joohee.A00.VO.BoardVO;
import org.joohee.A00.VO.SearchCriteria;
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

	public List<BoardMapper> getBoardList(BoardVO boardVO);

	public BoardMapper getBoardDetail(BoardVO boardVO);
}
