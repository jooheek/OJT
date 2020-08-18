/**
 * <PRE>
 *  Project : test
 *  Package : org.joohee.common
 * </PRE>
 * @file   : Criteria.java
 * @date   : 2020. 8. 12 오후 3:31:48
 * @author : NB-0308
 * @brief  :
 *  변경이력    : 
 *        이름     : 일자          : 근거자료   : 변경내용
 *       ------------------------------------
 *        NB-0308  : 2020. 8. 12       :            : 신규 개발.
 */
package org.joohee.A00.VO;

/**
 * <PRE>
 *  ClassName : Criteria 
 * </PRE>
 * @version : 1.0
 * @date    : 2020. 8. 12 오후 3:31:48
 * @author  : NB-0308
 * @brief   : 
 */

public class Criteria {
	
	private int page = 1;
	//현재 페이지 번호
	private int perPageNum = 10;
	//한 페이지당 보여줄 게시글의 갯수
	//페이지 기본 설정 맨처음 페이지를 보여주고, 10개의 게시글이 띄워짐
	
	public void setPage(int page) {
		if(page<=0) {
			this.page=1;
		}else {
			this.page = page;
		}
	}
	//페이지가 음수값이 나오지 않도록 설정 
	
	public void setPerPageNum(int pageCount) {
		int cnt= this.perPageNum;
		
		if(perPageNum!= cnt) {
			this.perPageNum=cnt;
		}else {
			this.perPageNum = pageCount;
		}
	}
	//페이지당 보여줄 게시글의 갯수가 유지되게 설정
	
	public int getPageStart() { 
		return (this.page -1) * perPageNum;
	}
	//특정페이지의 첫 게시글 rownum 
	
	public int getPage() {
		return page;
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}

	

}
