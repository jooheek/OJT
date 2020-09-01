/**
 * 
 */
package com.joohee.A01.vo;

import java.util.Date;

/**
 * @author USER
 *
 */
public class CommentDTO {
	
	private int NTT_SEQ;
	private int ANSWER_NO;
	private String WRTER_ID;
	private String WRTER_NM;
	private String ANSWER_SBST;
	private String ATCH_FILE_ID;
	private String ANSWER_PASSWORD;
	private String USE_YN;

	private Date CREAT_DATE;
	private String CREAT_ID;
	private Date UPDATE_DATE;
	private String UPDATE_ID;
	
	
	public int getNTT_SEQ() {
		return NTT_SEQ;
	}
	public void setNTT_SEQ(int nTT_SEQ) {
		NTT_SEQ = nTT_SEQ;
	}
	public int getANSWER_NO() {
		return ANSWER_NO;
	}
	public void setANSWER_NO(int aNSWER_NO) {
		ANSWER_NO = aNSWER_NO;
	}
	public String getWRTER_ID() {
		return WRTER_ID;
	}
	public void setWRTER_ID(String wRTER_ID) {
		WRTER_ID = wRTER_ID;
	}
	public String getWRTER_NM() {
		return WRTER_NM;
	}
	public void setWRTER_NM(String wRTER_NM) {
		WRTER_NM = wRTER_NM;
	}
	public String getANSWER_SBST() {
		return ANSWER_SBST;
	}
	public void setANSWER_SBST(String aNSWER_SBST) {
		ANSWER_SBST = aNSWER_SBST;
	}
	public String getATCH_FILE_ID() {
		return ATCH_FILE_ID;
	}
	public void setATCH_FILE_ID(String aTCH_FILE_ID) {
		ATCH_FILE_ID = aTCH_FILE_ID;
	}
	public String getANSWER_PASSWORD() {
		return ANSWER_PASSWORD;
	}
	public void setANSWER_PASSWORD(String aNSWER_PASSWORD) {
		ANSWER_PASSWORD = aNSWER_PASSWORD;
	}
	public String getUSE_YN() {
		return USE_YN;
	}
	public void setUSE_YN(String uSE_YN) {
		USE_YN = uSE_YN;
	}
	public Date getCREAT_DATE() {
		return CREAT_DATE;
	}
	public void setCREAT_DATE(Date cREAT_DATE) {
		CREAT_DATE = cREAT_DATE;
	}
	public String getCREAT_ID() {
		return CREAT_ID;
	}
	public void setCREAT_ID(String cREAT_ID) {
		CREAT_ID = cREAT_ID;
	}
	public Date getUPDATE_DATE() {
		return UPDATE_DATE;
	}
	public void setUPDATE_DATE(Date uPDATE_DATE) {
		UPDATE_DATE = uPDATE_DATE;
	}
	public String getUPDATE_ID() {
		return UPDATE_ID;
	}
	public void setUPDATE_ID(String uPDATE_ID) {
		UPDATE_ID = uPDATE_ID;
	}
	
	

}
