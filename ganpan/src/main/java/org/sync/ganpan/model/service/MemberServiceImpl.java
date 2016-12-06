package org.sync.ganpan.model.service;

import java.util.HashMap;

import javax.annotation.Resource;

//github.com/Yomni/ganpan.git
import org.springframework.stereotype.Service;
import org.sync.ganpan.model.dao.MemberDAO;
import org.sync.ganpan.model.vo.MemberVO;

/**
 * Member의 Business layer를 위한 ServiceClass
 * @author JYM
 *
 */
@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;

	public void registerMember(MemberVO mvo) {
		memberDAO.registerMember(mvo);
	}

	public int eMailCheck(String eMail) {
		return memberDAO.emailCheck(eMail);
	}

	public int nickNameCheck(String nickName) {
		return memberDAO.nickNameCheck(nickName);
	}

	public MemberVO findMemberByNickName(String nickName) {
		return memberDAO.findMemberByNickName(nickName);
	}

	@Override
	public MemberVO login(HashMap<String, String> map) {
		// id만 받아와서 login 가능--> 굳이 nickname login과 email login으로 나뉠 필요가 없으므로 수정
		return memberDAO.login(map);
	}

	@Override
	public int updateMember(MemberVO mvo) {
		return memberDAO.updateMember(mvo);
	}
}
