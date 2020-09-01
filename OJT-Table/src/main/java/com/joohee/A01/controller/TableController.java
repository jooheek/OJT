/**
 * 
 */
package com.joohee.A01.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.joohee.A01.service.TableService;
import com.joohee.A01.vo.CommentDTO;
import com.joohee.A01.vo.TableDTO;

/**
 * @author USER
 *
 */
@RestController
public class TableController {
	
	private static final Logger logger = LoggerFactory.getLogger(TableController.class);

	@Autowired
	TableService tableService;

	// 게시글 조회
	@GetMapping("/table")
	public List<TableDTO> getBoardList() throws Exception {

		return tableService.getBoardList();
	}

	// 게시글 기본 상세조회
	@GetMapping("/table/{NTT_SEQ}")
	public TableDTO getBoardDetail(@PathVariable("NTT_SEQ") int NTT_SEQ) throws Exception {

		return tableService.getBoardDetail(NTT_SEQ);
	}

	// 게시글 입력
	@PostMapping(value = "/table", produces = "application/json;")
	public String insertBoard(@RequestBody TableDTO tableDTO) {
		
		logger.info(tableDTO.toString());

		tableService.insertBoard(tableDTO);
		return "게시글 입력";
	}

	// 댓글입력
	@PostMapping(value = "/table/{NTT_SEQ}/comment", produces = "application/json; charset=utf8")
	public void insertComment(@RequestBody CommentDTO commentDTO) {

		tableService.insertComment(commentDTO);
	}

	// 댓글 조회
	@GetMapping(value = "/table/{NTT_SEQ}/comment")
	public CommentDTO getComment(@PathVariable("NTT_SEQ") int NTT_SEQ) throws Exception {

		return tableService.getComment(NTT_SEQ);
	}

	// 게시글 수정
	@PostMapping(value = "/table/{NTT_SEQ}/update", produces = "application/json; charset=utf8")
	public void updateBoard(@PathVariable("NTT_SEQ") int NTT_SEQ, @RequestParam("NTT_SJ") String NTT_SJ,
			@RequestParam("NTT_CN") String NTT_CN) throws Exception {

		tableService.updateBoard(NTT_SEQ, NTT_SJ, NTT_CN);
	}
	//데이터가 null인지 확인->script

	// 게시글 삭제
	@PostMapping("/table/{NTT_SEQ}/delete")
	public void deleteBoard(@PathVariable("NTT_SEQ") int NTT_SEQ) throws Exception {

		tableService.deleteBoard(NTT_SEQ);

	}
}
