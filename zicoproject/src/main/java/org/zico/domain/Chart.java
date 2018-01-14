package org.zico.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Chart {
	private Integer price, people, menuCount, storeNo, status;
	private String menu;
	private Date openTime, closeTime, countTime;
}
