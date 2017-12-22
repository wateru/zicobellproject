package org.zico.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.zico.dto.Criteria;
import org.zico.domain.Menu;

public interface MenuMapper extends CRUDMapper<Menu, Integer>{

	@Select("select * from menu  order by menuNo desc limit #{skip}, #{size}")
	public List<Menu> getMenu(Criteria cri);
	
	
	@Select("select * from menu where menuno=#{menuNo}")
	public Menu detailMenu(@Param(value="menuNo")int menuNo);
	
	@Select("select count(menuNo) from menu")
	public int getTotal();
	
	
}
