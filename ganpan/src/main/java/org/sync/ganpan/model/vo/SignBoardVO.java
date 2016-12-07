package org.sync.ganpan.model.vo;

import java.util.List;

public class SignBoardVO {
	private String signBoardName;
	private MemberVO bossMemberVO;
	private List<HaveBoardVO> boardList; // size는 반드시 3이 될 예정
	private int visibility;
	private String creationDate;

	public SignBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SignBoardVO(String bossNickName) {
		this.bossMemberVO.setNickName(bossNickName);
	}

	// SignBoardVO 강한 has a MemberVO(nickName)

	public SignBoardVO(String signBoardName, MemberVO bossMemberVO, List<HaveBoardVO> boardList, int visibility,String creationDate) {
		super();
		this.signBoardName = signBoardName;
		this.bossMemberVO = bossMemberVO;
		this.boardList = boardList;
		this.visibility = visibility;
		this.creationDate = creationDate;
	}

	public SignBoardVO(String signBoardName, MemberVO bossMemberVO) {
		super();
		this.signBoardName = signBoardName;
		this.bossMemberVO = bossMemberVO;
	}

	public SignBoardVO(String signBoardName, String bossNickName) {
		super();
		this.signBoardName = signBoardName;
		this.bossMemberVO = new MemberVO();
		this.bossMemberVO.setNickName(bossNickName);
	}

	public SignBoardVO(String signBoardName, String bossNickName, int visibility) {
		this.signBoardName = signBoardName;
		this.bossMemberVO = new MemberVO();
		this.bossMemberVO.setNickName(bossNickName);
		this.visibility = visibility;
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

	public List<HaveBoardVO> getBoardList() {
		return boardList;
	}

	public void setBoardList(List<HaveBoardVO> boardList) {
		this.boardList = boardList;
	}


	public int getVisibility() {
		return visibility;
	}

	public void setVisibility(int visibility) {
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
		return "SignBoardVO [signBoardName=" + signBoardName + ", bossMemberVO=" + bossMemberVO + ", boardList="
				+ boardList + ", visibility=" + visibility + ", creationDate=" + creationDate + "]";
	}
}// class SignBoardVO