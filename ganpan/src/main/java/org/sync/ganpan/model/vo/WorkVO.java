package org.sync.ganpan.model.vo;

public class WorkVO {
	private int workNo;
	private String workName;
	private String workDetails;
	private String creationDate;
	private String changeDate;
	private BoardGenreVO boardGenreVO;//boardNo
	//workerNickName==memberVO.getNickName() , signBoard.getSignBoardName() | getBossMemberVO()
	private OrganizationVO organizationVO;
	
	public WorkVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WorkVO(int workNo, String workName, String workDetails, String creationDate, String changeDate,
			BoardGenreVO boardGenreVO, OrganizationVO organizationVO) {
		super();
		this.workNo = workNo;
		this.workName = workName;
		this.workDetails = workDetails;
		this.creationDate = creationDate;
		this.changeDate = changeDate;
		this.boardGenreVO = boardGenreVO;
		this.organizationVO = organizationVO;
	}
	public int getWorkNo() {
		return workNo;
	}
	public void setWorkNo(int workNo) {
		this.workNo = workNo;
	}
	public String getWorkName() {
		return workName;
	}
	public void setWorkName(String workName) {
		this.workName = workName;
	}
	public String getWorkDetails() {
		return workDetails;
	}
	public void setWorkDetails(String workDetails) {
		this.workDetails = workDetails;
	}
	public String getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}
	public String getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(String changeDate) {
		this.changeDate = changeDate;
	}
	public BoardGenreVO getBoardGenreVO() {
		return boardGenreVO;
	}
	public void setBoardGenreVO(BoardGenreVO boardGenreVO) {
		this.boardGenreVO = boardGenreVO;
	}
	public OrganizationVO getOrganizationVO() {
		return organizationVO;
	}
	public void setOrganizationVO(OrganizationVO organizationVO) {
		this.organizationVO = organizationVO;
	}
	@Override
	public String toString() {
		return "WorkVO [workNo=" + workNo + ", workName=" + workName + ", workDetails=" + workDetails
				+ ", creationDate=" + creationDate + ", changeDate=" + changeDate + ", boardGenreVO=" + boardGenreVO
				+ ", organizationVO=" + organizationVO + "]";
	}
	
}//class WorkVO
