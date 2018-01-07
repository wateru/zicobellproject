package org.zico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zico.domain.Store;
import org.zico.dto.Criteria;
import org.zico.mappers.StoreMapper;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreMapper sm;
	
	@Transactional
	@Override
	public int create(Store store) {
		sm.create(store);
		
		return sm.last();
	}

	@Override
	public Store detail(int sno) {
		return sm.read(sno);
	}

	@Override
	public void update(Store store) {
		sm.update(store);
	}

	@Override
	public void remove(int sno) {
		sm.delete(sno);
	}

	@Override
	public List<Store> getList(Criteria cri) {
		return sm.list(cri);
	}

	@Override
	public int getListCount() {
		return sm.count();
	}

}
