package org.zico.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zico.domain.Member;
import org.zico.mappers.MemberMapper;

@Service
public class MembertServiceImpl implements MemberService{
	
	@Autowired
	MemberMapper membermapper;
	
	public void memberinsert(Member member) {
			membermapper.insertmember(member);
	};
	
	public Member mypage(String id) {
		
		return membermapper.mypage(id);
		
	};
	

}
