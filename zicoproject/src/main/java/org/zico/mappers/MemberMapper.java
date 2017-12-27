package org.zico.mappers;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.zico.domain.Member;

public interface MemberMapper {
	@Insert("insert into member(id,password,passwordquestion,passwordanswer,pnumber,grade) values(#{id},#{password},#{passwordquestion},#{passwordanswer},#{pnumber},#{grade})")
	public void insertmember(Member member);
	
	@Select("select * from member where id=#{id}")
	public Member mypageview(String id);
}
