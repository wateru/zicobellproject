package org.zico.mappers;

import java.util.List;

import org.zico.domain.Order;
import org.zico.domain.OrderDetail;

//재익 테스트임
public interface TempMapper {
	
	// 소켓 접속시 주문있는지 추출
	public List<Order> selectOrder(Integer orderNo);
	
	// 주문에 대한 상세값 추출
	public List<OrderDetail> selectOrderDetail(Integer orderno);
	
}
