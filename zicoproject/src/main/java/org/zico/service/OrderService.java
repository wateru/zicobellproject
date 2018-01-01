package org.zico.service;

import java.util.List;

import org.zico.domain.Menu;
import org.zico.domain.Store;
import org.zico.dto.Criteria;

public interface OrderService {
	
	public List<Store> getList(Criteria cri);
	public int getListCount();
	public List<Menu> getMenuList(Criteria cri);
	public int getMenuListCount();
}
