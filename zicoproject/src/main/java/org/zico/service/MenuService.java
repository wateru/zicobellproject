package org.zico.service;

import java.util.List;

import org.zico.domain.Menu;

public interface MenuService {
	
	public void create(Menu menu);

	public List<Menu> getList();
	
	public void remove(int menuNo);
	
	public Menu detali(int menuNo); 
	
	public void update(Menu menu);
}
