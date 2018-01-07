package org.zico.domain;

import lombok.Data;

@Data
public class Order {

	private int orderNo,storeNo,people,totalPrice;
	private	String memberId,status,pay;
}
