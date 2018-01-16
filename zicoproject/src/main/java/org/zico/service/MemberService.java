package org.zico.service;

import org.zico.domain.Member;

public interface MemberService {
	
	public Integer getId(String id);
	
	public void memberinsert(Member member);
	
	public Member mypage(String id);
}
