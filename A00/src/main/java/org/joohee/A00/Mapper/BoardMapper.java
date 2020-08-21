/**
 * 
 */
package org.joohee.A00.Mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.joohee.A00.VO.BoardVO;
import org.joohee.A00.VO.Criteria;
import org.joohee.A00.VO.SearchCriteria;

/**
 * @author jooheek
 *
 */
@Mapper
public interface BoardMapper {
	
	
	public List<Map<String,Object>> getList(SearchCriteria scri);

	public BoardVO read(int projectCode);
	//view에 들어가서 데이터를 불러오는 method

	public void delete(int projectCode);
	
	public void insertP(BoardVO vo)throws Exception;
	
	public void insertF(BoardVO vo)throws Exception;
	
	public void update(BoardVO vo)throws Exception;
	
	public int countBoardList(SearchCriteria scri)throws Exception;
	
	//ajax controller
	public List<BoardMapper> getBoardList(BoardVO boardVO);
	
}
