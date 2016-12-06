package org.sync.ganpan.model.vo;

public class WorkVO {
	private int workNo;
	private String workName;
	private String workDetails;
	private String creationDate;
	private String changeDate;
	private HaveBoardVO haveBoardVO;
	private OrganizationVO organizationVO;
	
	public WorkVO() {
		super();
	}
	
	public WorkVO(int workNo, String workName, String workDetails, String creationDate, String changeDate,
			HaveBoardVO haveBoardVO, OrganizationVO organizationVO) {
		super();
		this.workNo = workNo;
		this.workName = workName;
		this.workDetails = workDetails;
		this.creationDate = creationDate;
		this.changeDate = changeDate;
		this.haveBoardVO = haveBoardVO;
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

	public HaveBoardVO getHaveBoardVO() {
		return haveBoardVO;
	}

	public void setHaveBoardVO(HaveBoardVO haveBoardVO) {
		this.haveBoardVO = haveBoardVO;
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
				+ ", creationDate=" + creationDate + ", changeDate=" + changeDate + ", haveBoardVO=" + haveBoardVO
				+ ", organizationVO=" + organizationVO + "]";
	}
}
