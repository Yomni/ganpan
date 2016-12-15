package org.sync.ganpan.model.vo;

public class WorkVO {
	private int workNo;
	private String workName;
	private String workDetails;
	private String creationDate;
	private String changeDate;
	private int boardNo;
	private OrganizationVO organizationVO;

	public WorkVO() {
		super();
	}

	public WorkVO(int workNo, String workName, String workDetails) {
		super();
		this.workNo = workNo;
		this.workName = workName;
		this.workDetails = workDetails;
	}

	public WorkVO(int workNo, String workName, String workDetails, String creationDate, String changeDate, int boardNo,
			OrganizationVO organizationVO) {
		super();
		this.workNo = workNo;
		this.workName = workName;
		this.workDetails = workDetails;
		this.creationDate = creationDate;
		this.changeDate = changeDate;
		this.boardNo = boardNo;
		this.organizationVO = organizationVO;
	}

	public WorkVO(int workNo, String nickName) {
		this.workNo = workNo;
		this.organizationVO = new OrganizationVO(nickName);
	}
	
	//updateWork에 필요한 생성자 추가할것
	

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

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
				+ ", creationDate=" + creationDate + ", changeDate=" + changeDate + ", boardNo=" + boardNo
				+ ", organizationVO=" + organizationVO + "]";
	}
}
