package org.sync.ganpan.model.vo;

public class InvitationMngVO {

	private SignBoardVO signBoardVO;// signBoardName, bossNickName
	private MemberVO invitedMemberVO;// nickName
	private String invitationDate;

	public InvitationMngVO(SignBoardVO signBoardVO, MemberVO invitedMemberVO, String invitationDate) {
		super();
		this.signBoardVO = signBoardVO;
		this.invitedMemberVO = invitedMemberVO;
		this.invitationDate = invitationDate;
	}

	public InvitationMngVO(String signBoardName, String bossNickName, String nickName, String invitationDate) {
		super();
		this.signBoardVO = new SignBoardVO(signBoardName, bossNickName);
		this.invitedMemberVO = new MemberVO(nickName);
		this.invitationDate = invitationDate;
	}
	
	public InvitationMngVO(String signBoardName, String bossNickName, String nickName) {
		super();
		this.signBoardVO = new SignBoardVO(signBoardName, bossNickName);
		this.invitedMemberVO = new MemberVO(nickName);
	}

	public SignBoardVO getSignBoardVO() {
		return signBoardVO;
	}

	public void setSignBoardVO(SignBoardVO signBoardVO) {
		this.signBoardVO = signBoardVO;
	}

	public MemberVO getInvitedMemberVO() {
		return invitedMemberVO;
	}

	public void setInvitedMemberVO(MemberVO workNickName) {
		this.invitedMemberVO = workNickName;
	}

	public String getInvitationDate() {
		return invitationDate;
	}

	public void setInvitationDate(String invitationDate) {
		this.invitationDate = invitationDate;
	}

	@Override
	public String toString() {
		return "InvitationMngVO [signBoardVO=" + signBoardVO + ", invitedMemberVO=" + invitedMemberVO + ", invitationDate="
				+ invitationDate + "]";
	}

}// class InvitationMngVO
