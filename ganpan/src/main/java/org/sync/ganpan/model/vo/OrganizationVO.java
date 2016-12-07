package org.sync.ganpan.model.vo;

/**
 * Table schema가 올 예정
 * 
 * @author JYM
 *
 */
public class OrganizationVO {
	private MemberVO workerMemberVO;// workerNickName
	private SignBoardVO signBoardVO;// bossNickName, signBoardName

	public OrganizationVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrganizationVO(MemberVO workerMemberVO, SignBoardVO signBoardVO) {
		super();
		this.workerMemberVO = workerMemberVO;
		this.signBoardVO = signBoardVO;
	}

	public MemberVO getWorkerMemberVO() {
		return workerMemberVO;
	}

	public void setWorkerMemberVO(MemberVO workerMemberVO) {
		this.workerMemberVO = workerMemberVO;
	}

	public SignBoardVO getSignBoardVO() {
		return signBoardVO;
	}

	public void setSignBoardVO(SignBoardVO signBoardVO) {
		this.signBoardVO = signBoardVO;
	}

	@Override
	public String toString() {
		return "OrganizationVO [workerMemberVO=" + workerMemberVO + ", signBoardVO=" + signBoardVO + "]";
	}

}// class OrganizationVO
