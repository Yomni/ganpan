package org.sync.ganpan.model.service;

import org.sync.ganpan.model.vo.MemberVO;

public interface MemberService {

	int nickNameCheck(String nickName);
	int eMailCheck(String eMail);
	void register(MemberVO mvo);
	MemberVO findMemberByEmail(String eMail);

}