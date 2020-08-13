/**
 * 
 */
package org.joohee.A00.Service;

import java.util.List;
import java.util.Map;

import org.joohee.A00.VO.BoardVO;


/**
 * @author jooheek
 *
 */
public interface BoardService {
	
	
	public List<Map<String,Object>> getList(Map<String,Object>map);

	public void insert(BoardVO vo);

	public BoardVO read(int projectCode);
	
	public void delete(int projectCode);
	
	public void write(BoardVO vo)throws Exception;

	public void update(BoardVO vo)throws Exception;
}
