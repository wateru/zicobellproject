package org.zico.domain;

import lombok.Data;

@Data
public class ChartOrderDetail {
	private Integer subPrice, detailCount;
	private String menu;
}
