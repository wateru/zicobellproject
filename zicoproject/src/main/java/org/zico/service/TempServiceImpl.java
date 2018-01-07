package org.zico.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zico.domain.Order;
import org.zico.domain.OrderDetail;
import org.zico.mappers.TempMapper;

@Service
public class TempServiceImpl implements TempService {

	
	@Autowired
	TempMapper mapper;
	
	@Override
	public List<Order> getOrder(Integer orderNo) {
		return mapper.selectOrder(orderNo);
	}

	@Override
	public List<OrderDetail> getOrderDetail(Integer orderno) {
		return mapper.selectOrderDetail(orderno);
	}

}
