/**
 * <PRE>
 *  Project : A001
 *  Package : org.jooheek.A001.mapper
 * </PRE>
 * @file   : BoardVO.java
 * @date   : 2020. 8. 7 오전 11:12:04
 * @author : NB-0308
 * @brief  :
 *  변경이력    : 
 *        이름     : 일자          : 근거자료   : 변경내용
 *       ------------------------------------
 *        NB-0308  : 2020. 8. 7       :            : 신규 개발.
 */
package org.joohee.A00.VO;

/**
 * <PRE>
 *  ClassName : BoardVO 
 * </PRE>
 * @version : 1.0
 * @date    : 2020. 8. 7 오전 11:12:04
 * @author  : NB-0308
 * @brief   : 
 */

public class BoardVO {
	
	private int projectCode;
	private String projectId;
	private String projectName;
	private String startDate;
	private String endDate;
	private String projectManager;
	private String projectContractor;
	private String projectArea;
	private String teamName;
	private int expense;
	private int outsourcingCost;
	private int netSales;
	private int sales;
	private int goods;
	
	
	
	public String getProjectArea() {
		return projectArea;
	}
	public void setProjectArea(String projectArea) {
		this.projectArea = projectArea;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public int getProjectCode() {
		return projectCode;
	}
	public void setProjectCode(int projectCode) {
		this.projectCode = projectCode;
	}
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getProjectManager() {
		return projectManager;
	}
	public void setProjectManager(String projectManager) {
		this.projectManager = projectManager;
	}
	public String getProjectContractor() {
		return projectContractor;
	}
	public void setProjectContractor(String projectContractor) {
		this.projectContractor = projectContractor;
	}
	public int getExpense() {
		return expense;
	}
	public void setExpense(int expense) {
		this.expense = expense;
	}
	public int getOutsourcingCost() {
		return outsourcingCost;
	}
	public void setOutsourcingCost(int outsourcingCost) {
		this.outsourcingCost = outsourcingCost;
	}
	public int getNetSales() {
		return netSales;
	}
	public void setNetSales(int netSales) {
		this.netSales = netSales;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public int getGoods() {
		return goods;
	}
	public void setGoods(int goods) {
		this.goods = goods;
	}
	
}
