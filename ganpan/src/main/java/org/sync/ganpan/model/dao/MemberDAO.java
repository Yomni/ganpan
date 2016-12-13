package org.sync.ganpan.model.dao;

import java.util.HashMap;

//github.com/Yomni/ganpan.git
import org.sync.ganpan.model.vo.MemberVO;

public interface MemberDAO {

	MemberVO login(HashMap<String, String> map);

	void registerMember(MemberVO vo);

	int emailCheck(String email);

	int nickNameCheck(String nickName);

	MemberVO findMemberByNickName(String nickName);

	int updateMember(MemberVO mvo);

	int leave(MemberVO mvo);

}