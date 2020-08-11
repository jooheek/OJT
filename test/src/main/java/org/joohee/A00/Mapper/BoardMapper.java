/**
 * 
 */
package org.joohee.A00.Mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.joohee.A00.VO.BoardVO;

/**
 * @author jooheek
 *
 */
@Mapper
public interface BoardMapper {
	
	
	public List<Map<String,Object>> getList(Map<String, Object> map);

	public void insert(BoardVO vo);

	public BoardVO read(int projectCode);

	public int delete(int projectCode);
	
}
