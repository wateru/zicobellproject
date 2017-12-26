package org.zico.service;

import java.util.List;

import org.zico.domain.Store;
import org.zico.dto.Criteria;

public interface StoreService {

	public void create(Store store);
	
	public Store detail(int sno);
	
	public void update(Store store);
	
	public void remove(int sno);
	
	public List<Store> getList(Criteria cri);
	
	public int getListCount();
	
}
