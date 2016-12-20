package org.sync.ganpan.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.sync.ganpan.model.dao.MemberDAO;
import org.sync.ganpan.model.dao.WorkDAO;
import org.sync.ganpan.model.vo.MemberVO;

/**
 * Member의 Business layer를 위한 ServiceClass
 * 
 * @author JYM
 *
 */
@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;
	@Resource
	private WorkDAO workDAO;

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

	@Override
	public int idCheck(String id) {
		int emailCount = memberDAO.emailCheck(id);
		int nickNameCount = memberDAO.nickNameCheck(id);
		if (emailCount == 0 && nickNameCount == 0)
			return 0;
		else
			return 1;
	}

	@Override
	@Transactional
	public int leave(String nickName, String password) {
		MemberVO mvo = new MemberVO(nickName, password);
		// 1. 닉네임을 받아서 work table에서 닉네임과 일치하는 것들 모두 수정
		// 2. member table에서 닉네임 delete
		// 3. transaction 처리
		workDAO.updateWorkerToNullByNickName(nickName);
		return memberDAO.leave(mvo);
	}

	@Override
	public List<MemberVO> findAllMemberById(String id) {
		return memberDAO.findAllMemberById(id);
	}
}
