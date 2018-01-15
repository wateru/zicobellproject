package org.zico.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SearchChart {
	private String status;
	private Integer storeNo;
	private String startTime, closeTime; 
}
