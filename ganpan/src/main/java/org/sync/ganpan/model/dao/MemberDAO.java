package org.sync.ganpan.model.dao;

import org.sync.ganpan.model.vo.MemberVO;

public interface MemberDAO {

	void register(MemberVO vo);
	int emailCheck(String email);
	int nickNameCheck(String nickName);
	MemberVO findMemberByEmail(String email);

}