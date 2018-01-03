package org.zico.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zico.domain.Check;
import org.zico.mappers.LoginCheckMapper;

@Service
public class LoginService {
		
	
	@Autowired
	LoginCheckMapper loginmapper;

	public Check idcheck(Check vo) {
	Check result= loginmapper.idcheck(vo);
		return result;
	}
	
	public Integer getStoreNo(String smid) {
		return loginmapper.selectstoreno(smid);
	}
	
	public Integer getGrade(String smid) {
		return loginmapper.selectGrade(smid);
	}
}
