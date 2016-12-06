package org.sync.ganpan.model.vo;

/**
 * Table schema가 올 예정
 * 
 * @author JYM
 *
 */
public class OrganizationVO {
	private MemberVO workerNickName;// workerNickName
	private SignBoardVO signBoardVO;// bossNickName, signBoardName
	
	public OrganizationVO() {
		super();
	}
	//Organization 강한 has a signBoardVO & 강한 has a signBoardVO
	public OrganizationVO(MemberVO workerNickName, SignBoardVO signBoardVO) {
		super();
		this.workerNickName = workerNickName;
		this.signBoardVO = signBoardVO;
	}
	
	/*//추가 at 16.12.06 15:39 - 필요없음
	public OrganizationVO(String nickName,String signBoardName,String bossNickName){
		super();
		this.workerNickName=new MemberVO(nickName);
		this.signBoardVO=new SignBoardVO(signBoardName, bossNickName);
	}*/
	
	public MemberVO getWorkerNickName() {
		return workerNickName;
	}
	public void setWorkerNickName(MemberVO workerNickName) {
		this.workerNickName = workerNickName;
	}
	public SignBoardVO getSignBoardVO() {
		return signBoardVO;
	}
	public void setSignBoardVO(SignBoardVO signBoardVO) {
		this.signBoardVO = signBoardVO;
	}
	@Override
	public String toString() {
		return "OrganizationVO [workerNickName=" + workerNickName + ", signBoardVO=" + signBoardVO + "]";
	}
	

}// class OrganizationVO
