package org.zico.dto;

public class Criteria {

	private int page;
	private int size;
	private int storeNo;
	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	// 비어있는 생성자 기본 세팅
	public Criteria() {
		this(1, 9);
	}

	public Criteria(int page, int size) {
		this.page = page;
		this.size = size;
	}
	
	public void setSize(int size) {
		this.size = size;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	public int getPage() {
		return this.page;
	}
	
	public int getSkip() {
		return (this.page - 1) * this.size;
	}
	
	public int getSize() {
		return this.size != 0 ? this.size : 9;
	}
	
}
