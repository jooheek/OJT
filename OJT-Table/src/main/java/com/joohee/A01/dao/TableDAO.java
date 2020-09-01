/**
 * 
 */
package com.joohee.A01.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.joohee.A01.vo.CommentDTO;
import com.joohee.A01.vo.TableDTO;

/**
 * @author USER
 *
 */
@Repository
@Mapper
public interface TableDAO {
	
	//게시글 목록 조회
	public List<TableDTO> getBoardList();	
	
	//게시굴 상세 조회
	public TableDTO getBoardDetail(int nTT_SEQ);

	//게시글 입력
	public void insertBoard(TableDTO tableDTO);

	//게시글 수정
	public void updateBoard(int NTT_SEQ,String NTT_SJ,String NTT_CN);
	
	//게시글 삭제
	public int deleteBoard(int nTT_SEQ);

	//게시글 조회수
	public int readCount(int nTT_SEQ);	
	//전체 게시글 갯수
	public int getBoardCount();

	//게시글 비밀번호 확인후 상세조회
	public TableDTO getBoardDetailChkPassword(int nTT_SEQ, int nTT_PASSWORD);

	//댓글 작성
	public void insertComment(CommentDTO commentDTO);

	//댓글 조회
	public CommentDTO getComment(int nTT_SEQ);


}
