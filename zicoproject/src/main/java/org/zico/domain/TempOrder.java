package org.zico.domain;

import lombok.Data;

@Data
public class TempOrder {
	private int orderNo, orderStoreNo, orderPeople, orderTotPrice;
	private	String orderMemberId,orderStatus,orderPay;
}
