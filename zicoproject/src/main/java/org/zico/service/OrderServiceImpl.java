package org.zico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zico.domain.Menu;
import org.zico.domain.Order;
import org.zico.domain.OrderDetail;
import org.zico.domain.Store;
import org.zico.dto.Criteria;
import org.zico.mappers.MenuMapper;
import org.zico.mappers.OrderDetailMapper;
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
	@Autowired
	private OrderDetailMapper orderDetailMapper;
	
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
		return menuMapper.menulist(cri);
		
	}

	@Override
	public int getMenuListCount() {
		// TODO Auto-generated method stub
		return menuMapper.count();
	}
	//최초 주문시 인설트로 장바구니
	@Transactional
	@Override
	public int insert(Order order) {
		System.out.println("욜로 들어오기는함??");
		orderMapper.create(order);
		System.out.println(orderMapper.last());
		return orderMapper.last();
	}
	//중복이 있을경우 업데이트로 장바구니
	@Override
	public void orderUpdate(Order order) {
		orderMapper.update(order);
		
		
	}
	//업데이할떄 번호를 알아야하기떄문에 검색
	@Override
	public int orderNoSelect(Order order) {
		return orderMapper.orderNoSelect(order);
	}
	//새로운 장바구니를 만들기위해 기존 디테일 삭제
	@Override
	public void detailDelete(int orderNo) {
		orderDetailMapper.delete(orderNo);
		
	}

	//장바구니로 가기위해 디테일 등록
	@Override
	public void detailInsert(OrderDetail detail) {
		
		orderDetailMapper.create(detail);
		
		
	}

	@Override
	public Order orderList(Order order) {
		
		return orderMapper.orderlist(order);
	}

	@Override
	public List<OrderDetail> orderDetailList(OrderDetail detail) {

		System.out.println("디테일 조회 id :["+detail.getMemberId()+"]");
		System.out.println("디테일 조회 상태:["+detail.getStatus()+"]");
		return orderDetailMapper.orderDetailList(detail);
	}

	@Override
	public int comparisonCount(Order order) {
		return orderMapper.comparisonCount(order);
	}

	





	
	





}
