package org.sync.ganpan.model.vo;

public class SignBoardVO {
	private String signBoardName;
	private MemberVO bossMemberVO;
	private boolean visibility;
	private String creationDate;
	//SignBoardVO 강한 has a MemberVO(nickName)
	public SignBoardVO(String signBoardName, MemberVO bossMemberVO, boolean visibility, String creationDate) {
		super();
		this.signBoardName = signBoardName;
		this.bossMemberVO = bossMemberVO;
		this.visibility = visibility;
		this.creationDate = creationDate;
	}
	
	public SignBoardVO(String signBoardName, String bossNickname) {
		super();
		this.signBoardName = signBoardName;
		this.bossMemberVO = new MemberVO();
		this.bossMemberVO.setNickName(bossNickname);
	}
	
	public String getSignBoardName() {
		return signBoardName;
	}

	public void setSignBoardName(String signBoardName) {
		this.signBoardName = signBoardName;
	}

	public MemberVO getBossMemberVO() {
		return bossMemberVO;
	}

	public void setBossMemberVO(MemberVO bossMemberVO) {
		this.bossMemberVO = bossMemberVO;
	}

	public boolean isVisibility() {
		return visibility;
	}

	public void setVisibility(boolean visibility) {
		this.visibility = visibility;
	}

	public String getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}

	@Override
	public String toString() {
		return "SignBoardVO [signBoardName=" + signBoardName + ", bossMemberVO=" + bossMemberVO + ", visibility="
				+ visibility + ", creationDate=" + creationDate + "]";
	}

}// class SignBoardVO
