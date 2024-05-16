package com.nnn.app.vo;

public class Criteria {

	// 페이징 처리
//	private int page; 
//	private int perPageNum;
	
	private String keyword1;
	private String keyword2;
	private String keyword3;
	private String type1;
	private String type2;
	private String type3;
	
	public Criteria() {

//		this.page = 1;
//		this.perPageNum = 10;	// 페이징 처리시 1페이지당 출력되는 게시물 수
	    this.keyword1 = getKeyword1();
	    this.keyword2 = getKeyword2();
	    this.keyword3 = getKeyword3();
	    this.type1 = getType1();
	    this.type2 = getType2();
	    this.type3 = getType3();
		
		return;

	}
	
	public String getType1() {
		return type1;
	}
	public void setType1(String type1) {
		this.type1 = type1;
	}
	
	public String getType2() {
		return type2;
	}
	public void setType2(String type2) {
		this.type2 = type2;
	}
	
	public String getType3() {
		return type3;
	}
	public void setType3(String type3) {
		this.type3 = type3;
	}
	
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	public String getKeyword2() {
		return keyword2;
	}
	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}
	public String getKeyword3() {
		return keyword3;
	}
	public void setKeyword3(String keyword3) {
		this.keyword3 = keyword3;
	}
	
//	public int getPageStart() {
//		return (this.page - 1)  * perPageNum;
//	}
//	
//	public int getPage() {
//		return page;
//	}
//	
//	public void setPage(int page) {
//		
//		if(page <=0) {
//			this.page =1;
//		}else {
//			this.page=page;
//		}
//	}
//	
//	public int getPerPageNum() {
//		
//		return perPageNum;
//	}
//	
//	public void setPerPageNum(int pageCount) {
//		
//		int cnt = this.perPageNum;
//		
//		if(pageCount != cnt) {
//			this.perPageNum = cnt;
//		}else {
//			this.perPageNum = pageCount;
//		}
//		
//	}
//	
//	@Override
//	public String toString() {
//		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", keyword1=" + keyword1 +", keyword2=" + keyword2 + ", keyword3=" + keyword3 +  
//				", type1=" + type1 + ", type2=" + type2 + ", type3=" + type3
//				+ "]";
//	}
	
	@Override
	public String toString() {
		return "Criteria [keyword1=" + keyword1 +", keyword2=" + keyword2 + ", keyword3=" + keyword3 +  
				", type1=" + type1 + ", type2=" + type2 + ", type3=" + type3
				+ "]";
	}
	
}
