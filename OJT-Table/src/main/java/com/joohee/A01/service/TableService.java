/**
 * 
 */
package com.joohee.A01.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.joohee.A01.dao.TableDAO;
import com.joohee.A01.vo.CommentDTO;
import com.joohee.A01.vo.TableDTO;

/**
 * @author USER
 *
 */
@Service
public class TableService {

	@Autowired
	public TableDAO tableDAO;

	// 게시글 목록 조회
	public List<TableDTO> getBoardList() {

		return tableDAO.getBoardList();
	}

	// 게시굴 상세 조회
	@Transactional
	public TableDTO getBoardDetail(int NTT_SEQ) {
		
		//게시물 조회수
		tableDAO.readCount(NTT_SEQ);

		return tableDAO.getBoardDetail(NTT_SEQ);
	}

	// 게시글 입력
	public void insertBoard(TableDTO tableDTO) {

		tableDAO.insertBoard(tableDTO);
	}

	// 게시글 수정
	public void updateBoard(int NTT_SEQ,String NTT_SJ,String NTT_CN) {
	
	 tableDAO.updateBoard(NTT_SEQ,NTT_SJ,NTT_CN);
	}

	// 게시글 삭제
	public void deleteBoard(int nTT_SEQ) {

		tableDAO.deleteBoard(nTT_SEQ);
	}

	// 전체 게시글 갯수
	public int getBoardCount() {

		return tableDAO.getBoardCount();
	}

	// 게시글 비밀번호 확인후 상세조회
	public TableDTO getBoardDetailChkPassword(int nTT_SEQ, int nTT_PASSWORD) {

		return tableDAO.getBoardDetailChkPassword(nTT_SEQ, nTT_PASSWORD);
	}

	//댓글 작성
	public void insertComment(CommentDTO commentDTO) {
		
		tableDAO.insertComment(commentDTO);
	}

	//댓글 조회
	public CommentDTO getComment(int nTT_SEQ) {

		return tableDAO.getComment(nTT_SEQ);
	}

}
