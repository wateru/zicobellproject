package org.zico.domain;

import lombok.Data;

@Data
public class OrderDetail {
	private int orderNo,menuNo,storeNo,count,price,subTotal;
	private String token,menuName,status,memberId,menuImg;
}
