package org.zico.domain;

import lombok.Data;

@Data
public class TempOrderDetail {
	private int detailOrderNo,detailMenuNo,detailStoreNo,detailCount,detailPrice,detailSubTotal;
	/*private String token,menuName,status,memberId,menuImg;*/
	/*토큰이없음*/
	private String detailMenuName,detailMemberId,detailStatus,detailMenuImg;
}
