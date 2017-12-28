package org.zico.mappers;

import org.apache.ibatis.annotations.Select;
import org.zico.domain.Check;

public interface LoginCheckMapper {
	
	@Select("select * from member where member_id=#{member_id} and member_password=#{member_password}")
	public Check idcheck(Check vo);
	
	//storeid 확인
	@Select("select store_no from store where store_member_id = #{smid};")
	public Integer selectstoreno(String smid);
}
