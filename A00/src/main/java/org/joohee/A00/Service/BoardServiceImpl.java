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
import org.joohee.A00.controller.HomeController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<Map<String, Object>> getList(Map<String, Object> map) {
		List<Map<String, Object>> list = boardMapper.getList(map);
		
		return list;
	}

	@Override
	public void insert(BoardVO vo) {
		
	}

	@Override
	public BoardVO read(int projectCode) {
		return boardMapper.read(projectCode);
	}

	@Override
	public void delete(int projectCode) {

		boardMapper.delete(projectCode);
	}

	@Override
	public void write(BoardVO vo) throws Exception {

		boardMapper.write(vo);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		
		boardMapper.update(vo);
	}



}
