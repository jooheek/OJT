/**
 * 
 */
package com.joohee.A01.vo;

import java.sql.Date;


/**
 * @author USER
 *
 */
public class TableDTO {
	
	private int nttSeq;
	private int nttNo;

	private String nttSubject;
	private String nttContent;
	private String answerAt;
	private String pushAt;
	
	private int parentSeqNo;
	private int answerLc;
	private int sortOrder;
	private int nttReadCnt;
	
	private Date ntceBeginDate;
	private Date ntceEndDate;
	private String ntcrId;
	private String ntcrName;
	private String ntcrPw;
	
	private String attchedFileNo;
	private String useYn;
	private Date createDate;
	private String createId;
	private Date updateDate;
	private String updateId;
	
	
	
	public int getNttSeq() {
		return nttSeq;
	}
	public void setNttSeq(int nttSeq) {
		this.nttSeq = nttSeq;
	}
	public int getNttNo() {
		return nttNo;
	}
	public void setNttNo(int nttNo) {
		this.nttNo = nttNo;
	}
	public String getNttSubject() {
		return nttSubject;
	}
	public void setNttSubject(String nttSubject) {
		this.nttSubject = nttSubject;
	}
	public String getNttContent() {
		return nttContent;
	}
	public void setNttContent(String nttContent) {
		this.nttContent = nttContent;
	}
	public String getAnswerAt() {
		return answerAt;
	}
	public void setAnswerAt(String answerAt) {
		this.answerAt = answerAt;
	}
	public String getPushAt() {
		return pushAt;
	}
	public void setPushAt(String pushAt) {
		this.pushAt = pushAt;
	}
	public int getParentSeqNo() {
		return parentSeqNo;
	}
	public void setParentSeqNo(int parentSeqNo) {
		this.parentSeqNo = parentSeqNo;
	}
	public int getAnswerLc() {
		return answerLc;
	}
	public void setAnswerLc(int answerLc) {
		this.answerLc = answerLc;
	}
	public int getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}
	public int getNttReadCnt() {
		return nttReadCnt;
	}
	public void setNttReadCnt(int nttReadCnt) {
		this.nttReadCnt = nttReadCnt;
	}
	public Date getNtceBeginDate() {
		return ntceBeginDate;
	}
	public void setNtceBeginDate(Date ntceBeginDate) {
		this.ntceBeginDate = ntceBeginDate;
	}
	public Date getNtceEndDate() {
		return ntceEndDate;
	}
	public void setNtceEndDate(Date ntceEndDate) {
		this.ntceEndDate = ntceEndDate;
	}
	public String getNtcrId() {
		return ntcrId;
	}
	public void setNtcrId(String ntcrId) {
		this.ntcrId = ntcrId;
	}
	public String getNtcrName() {
		return ntcrName;
	}
	public void setNtcrName(String ntcrName) {
		this.ntcrName = ntcrName;
	}
	public String getNtcrPw() {
		return ntcrPw;
	}
	public void setNtcrPw(String ntcrPw) {
		this.ntcrPw = ntcrPw;
	}
	public String getAttchedFileNo() {
		return attchedFileNo;
	}
	public void setAttchedFileNo(String attchedFileNo) {
		this.attchedFileNo = attchedFileNo;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getCreateId() {
		return createId;
	}
	public void setCreateId(String createId) {
		this.createId = createId;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateId() {
		return updateId;
	}
	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}
	
	 

}
