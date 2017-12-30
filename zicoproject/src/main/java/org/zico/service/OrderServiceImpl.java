package org.zico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zico.domain.Store;
import org.zico.dto.Criteria;
import org.zico.mappers.OrderMapper;
import org.zico.mappers.StoreMapper;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private StoreMapper storeMapper;
	
	@Override
	public List<Store> getList(Criteria cri) {
		
		return storeMapper.list(cri);
	}

	@Override
	public int getListCount() {
		
		return storeMapper.count();
	}

}
