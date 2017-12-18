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
	public List<Menu> getList() {

		return mapper.getMenu();
	}

	@Override
	public void remove(int menuNo) {
		mapper.delete(menuNo);
		
	}

	@Override
	public Menu detali(int menuNo) {
		// TODO Auto-generated method stub
		 return mapper.detailMenu(menuNo);
	}

	@Override
	public void update(Menu menu) {
		// TODO Auto-generated method stub
		mapper.update(menu);
	}

	@Override
	public int getListCount(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotal(cri);
	}

	
}
