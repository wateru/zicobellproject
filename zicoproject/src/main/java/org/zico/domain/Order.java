package org.zico.domain;

import lombok.Data;

@Data
public class Order {

		int orderNo,storeNo,people,totalPrice;
		String memberId,status,pay;
}
