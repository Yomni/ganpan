package org.sync.ganpan.model.vo;

/**
 * Table schema가 올 예정
 * 
 * @author JYM
 *
 */
public class OrganizationVO {
	private MemberVO memberVO;// workerNickName
	private SignBoardVO signBoardVO;// bossNickName, signBoardName
	public OrganizationVO() {
		super();
	}
	//Organization 강한 has a signBoardVO & 강한 has a signBoardVO
	public OrganizationVO(MemberVO memberVO, SignBoardVO signBoardVO) {
		super();
		this.memberVO = memberVO;
		this.signBoardVO = signBoardVO;
	}
	
	//추가 at 16.12.06 15:39 
	public OrganizationVO(String workerNickName,String signBoardName,String bossNickName){
		super();
		this.memberVO=new MemberVO(workerNickName);
		this.signBoardVO=new SignBoardVO(signBoardName, bossNickName);
	}
	

	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public SignBoardVO getSignBoardVO() {
		return signBoardVO;
	}
	public void setSignBoardVO(SignBoardVO signBoardVO) {
		this.signBoardVO = signBoardVO;
	}
	@Override
	public String toString() {
		return "OrganizationVO [memberVO=" + memberVO + ", signBoardVO=" + signBoardVO + "]";
	}

}// class OrganizationVO
