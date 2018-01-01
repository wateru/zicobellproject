package org.zico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zico.domain.Menu;
import org.zico.domain.Store;
import org.zico.dto.Criteria;
import org.zico.mappers.MenuMapper;
import org.zico.mappers.OrderMapper;
import org.zico.mappers.StoreMapper;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private StoreMapper storeMapper;
	@Autowired
	private MenuMapper menuMapper;
	
	@Override
	public List<Store> getList(Criteria cri) {
		
		return storeMapper.list(cri);
	}

	@Override
	public int getListCount() {
		
		return storeMapper.count();
	}

	@Override
	public List<Menu> getMenuList(Criteria cri) {
		// TODO Auto-generated method stub
		System.out.println("서비스 들어옴");
		return menuMapper.list(cri);
		
	}

	@Override
	public int getMenuListCount() {
		// TODO Auto-generated method stub
		return menuMapper.count();
	}
	

}
