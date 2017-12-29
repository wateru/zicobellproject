package org.zico.service;

import java.util.List;

import org.zico.domain.Menu;
import org.zico.dto.Criteria;
import org.zico.mappers.MenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl implements MenuService{

	@Autowired
	private MenuMapper mapper;
	
	@Override
	public void create(Menu menu) {
		mapper.create(menu);
		
	}

	@Override
	public List<Menu> getList(Criteria cri) {
		//System.out.println("service : " +  storeNo);
		return mapper.menulist(cri);
	}

	@Override
	public void remove(int menuNo) {
		mapper.delete(menuNo);
		
	}

	@Override
	public Menu detali(int menuNo) {
		// TODO Auto-generated method stub
		 return mapper.read(menuNo);
	}

	@Override
	public void update(Menu menu) {
		// TODO Auto-generated method stub
		mapper.update(menu);
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return mapper.count();
	}

	

	
}
