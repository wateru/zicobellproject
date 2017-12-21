package org.zico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zico.domain.Store;
import org.zico.dto.Criteria;
import org.zico.mappers.StoreMapper;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreMapper sm;
	
	@Override
	public void create(Store store) {
		sm.create(store);
	}

	@Override
	public Store detail(int storeNo) {
		return sm.read(storeNo);
	}

	@Override
	public void update(Store store) {
		sm.update(store);
	}

	@Override
	public void remove(int storeNo) {
		sm.delete(storeNo);
	}

	@Override
	public List<Store> getList(Criteria cri) {
		return sm.getStore(cri);
	}

	@Override
	public int getListCount(Criteria cri) {
		return sm.getTotal(cri);
	}

}
