package org.zico.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.zico.domain.Menu;

public interface MenuMapper extends CRUDMapper<Menu, Integer>{

	@Select("select * from menu")
	public List<Menu> getMenu();
	
	
	@Select("select * from menu where menuno=#{menuNo}")
	public Menu detailMenu(@Param(value="menuNo")int menuNo);
	
}
