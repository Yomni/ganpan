package org.sync.ganpan.model.vo;

import java.security.Timestamp;

public class InvitationMngVO {

	private SignBoardVO signBoardVO;// signBoardNamem, bossNickName
	private MemberVO workNickName;// nickName
	private String invitationDate;

	public InvitationMngVO(SignBoardVO signBoardVO, MemberVO workNickName, String invitationDate) {
		super();
		this.signBoardVO = signBoardVO;
		this.workNickName = workNickName;
		this.invitationDate = invitationDate;
	}

	public InvitationMngVO(String signBoardName, String bossNickName, String nickName, String invitationDate) {
		super();
		this.signBoardVO = new SignBoardVO(signBoardName, bossNickName);
		this.workNickName = new MemberVO(nickName);
		this.invitationDate = invitationDate;
	}

	public SignBoardVO getSignBoardVO() {
		return signBoardVO;
	}

	public void setSignBoardVO(SignBoardVO signBoardVO) {
		this.signBoardVO = signBoardVO;
	}

	public MemberVO getWorkNickName() {
		return workNickName;
	}

	public void setWorkNickName(MemberVO workNickName) {
		this.workNickName = workNickName;
	}

	public String getInvitationDate() {
		return invitationDate;
	}

	public void setInvitationDate(String invitationDate) {
		this.invitationDate = invitationDate;
	}

	@Override
	public String toString() {
		return "InvitationMngVO [signBoardVO=" + signBoardVO + ", workNickName=" + workNickName + ", invitationDate="
				+ invitationDate + "]";
	}

}// class InvitationMngVO
