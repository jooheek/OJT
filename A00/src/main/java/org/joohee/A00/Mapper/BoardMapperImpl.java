/**
 * <PRE>
 *  Project : test
 *  Package : org.joohee.A00.Mapper
 * </PRE>
 * 
 * @file : BoardMapperImpl.java
 * @date : 2020. 8. 10 오후 5:39:12
 * @author : NB-0308
 * @brief : 변경이력 : 이름 : 일자 : 근거자료 : 변경내용 ------------------------------------
 *        NB-0308 : 2020. 8. 10 : : 신규 개발.
 */
/*
 * package org.joohee.A00.Mapper;
 * 
 * import java.util.List; import java.util.Map;
 * 
 * import javax.inject.Inject; import javax.print.DocFlavor.STRING;
 * 
 * import org.apache.ibatis.session.SqlSession; import
 * org.joohee.A00.VO.BoardVO; import org.joohee.A00.VO.SearchCriteria; import
 * org.joohee.A00.controller.HomeController; import org.joohee.A00.dto.BoardDTO;
 * import org.slf4j.Logger; import org.slf4j.LoggerFactory; import
 * org.springframework.stereotype.Repository; import
 * org.springframework.util.StringUtils;
 * 
 *//**
	 * <PRE>
	 *  ClassName : BoardMapperImpl
	 * </PRE>
	 * 
	 * @version : 1.0
	 * @date : 2020. 8. 10 오후 5:39:12
	 * @author : NB-0308
	 * @brief :
	 *//*
		 * @Repository public class BoardMapperImpl implements BoardMapper{
		 * 
		 * 
		 * @Inject private SqlSession sqlSession;
		 * 
		 * private static final String getList="BoardMapper.getList"; private static
		 * final String read ="BoardMapper.read"; private static final String delete
		 * ="BoardMapper.deleteBoard"; private static final String insertP
		 * ="BoardMapper.insertP"; private static final String insertF
		 * ="BoardMapper.insertF"; private static final String update
		 * ="BoardMapper.update"; private static final String countBoardList
		 * ="BoardMapper.countBoardList";
		 * 
		 * 
		 * @Override public List<Map<String, Object>> getList(SearchCriteria scri) {
		 * 
		 * return sqlSession.selectList(getList,scri); }
		 * 
		 * 
		 * 
		 * @Override public BoardVO read(int projectCode) {
		 * 
		 * return (BoardVO)sqlSession.selectOne(read,projectCode); }
		 * 
		 * 
		 * 
		 * @Override public void delete(int projectCode) {
		 * 
		 * sqlSession.delete(delete,projectCode); }
		 * 
		 * 
		 * 
		 * @Override public void insertP(BoardVO vo) throws Exception {
		 * 
		 * sqlSession.insert(insertP,vo); }
		 * 
		 * 
		 * 
		 * @Override public void update(BoardVO vo) throws Exception {
		 * 
		 * sqlSession.update(update,vo); }
		 * 
		 * 
		 * 
		 * @Override public int countBoardList(SearchCriteria scri) throws Exception {
		 * 
		 * return (Integer)sqlSession.selectOne(countBoardList,scri); } //integer로
		 * 파싱해야함??
		 * 
		 * 
		 * 
		 * @Override public void insertF(BoardVO vo) throws Exception {
		 * 
		 * sqlSession.insert(insertF,vo); }
		 * 
		 * 
		 * //ajaxcontroller
		 * 
		 * @Override public List<BoardDTO> getBoardList(BoardVO boardVO) {
		 * 
		 * return sqlSession.selectList("BoardMapper.getBoardList",boardVO); }
		 * 
		 * 
		 * 
		 * @Override public BoardDTO getBoardDetail(BoardVO boardVO) {
		 * 
		 * return sqlSession.selectOne("BoardMapper.getBoardDetail",boardVO); }
		 * 
		 * 
		 * 
		 * @Override public int insertBoard(BoardVO boardVO) {
		 * 
		 * return sqlSession.insert("BoardMapper.insertBoard",boardVO); }
		 * 
		 * 
		 * 
		 * @Override public int deleteBoard(BoardVO boardVO) {
		 * 
		 * return sqlSession.delete("BoardMapper.deleteBoard",boardVO); }
		 * 
		 * 
		 * 
		 * @Override public int updateBoard(BoardVO boardVO) {
		 * 
		 * return sqlSession.update("BoardMapper.updateBoard",boardVO); }
		 * 
		 * 
		 * 
		 * @Override public int getBoardCnt() throws Exception {
		 * 
		 * return sqlSession.selectOne("BoardMapper.getBoardCnt"); }
		 * 
		 * 
		 * }
		 */