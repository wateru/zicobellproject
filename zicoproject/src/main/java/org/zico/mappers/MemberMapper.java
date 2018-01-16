package org.zico.mappers;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.zico.domain.Member;

public interface MemberMapper {
	@Insert("insert into member(member_name, member_id, member_password, member_pwd_hint, member_pwd_anwser, member_phone, member_grade )"
			+ " values (#{mname},#{mid},#{mpassword},#{mquestion},#{mqpassword},#{mphone},#{mgrade})")
	public void insertmember(Member member);
	
	public Integer selectId(String id);
	
	public Member mypage(String id);
}
