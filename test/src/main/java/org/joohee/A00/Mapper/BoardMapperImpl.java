/**
 * <PRE>
 *  Project : test
 *  Package : org.joohee.A00.Mapper
 * </PRE>
 * @file   : BoardMapperImpl.java
 * @date   : 2020. 8. 10 오후 5:39:12
 * @author : NB-0308
 * @brief  :
 *  변경이력    : 
 *        이름     : 일자          : 근거자료   : 변경내용
 *       ------------------------------------
 *        NB-0308  : 2020. 8. 10       :            : 신규 개발.
 */
package org.joohee.A00.Mapper;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.joohee.A00.VO.BoardVO;
import org.springframework.stereotype.Repository;

/**
 * <PRE>
 *  ClassName : BoardMapperImpl 
 * </PRE>
 * @version : 1.0
 * @date    : 2020. 8. 10 오후 5:39:12
 * @author  : NB-0308
 * @brief   : 
 */
@Repository
public class BoardMapperImpl implements BoardMapper{
	
	@Inject
	private SqlSession sqlSession;
	
//	private static final String getList="BoardMapper.getList";
	private static final String read ="BoardMapper.insert";
	private static final String insert="BoardMapper.insertBoard";
	private static final String delete ="BoardMapper.deleteBoard";

	@Override
	public List<Map<String, Object>> getList(Map<String, Object> map) {

		return null;
	}



	@Override
	public BoardVO read(int projectCode) {

		return (BoardVO)sqlSession.selectOne(read,projectCode);
	}



	@Override
	public void insert(BoardVO vo) {
		
		sqlSession.insert(insert,vo);
		
	}



	@Override
	public int delete(int projectCode) {
			
		return sqlSession.delete(delete,projectCode);
	}


}
