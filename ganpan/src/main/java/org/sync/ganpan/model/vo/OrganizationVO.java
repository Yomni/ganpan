package org.sync.ganpan.model.vo;

/**
 * Table schema가 올 예정
 * @author JYM
 *
 */
public class OrganizationVO {
	private String workerNickName;
	private String signBoardName;
	private String bossNickName;

	public OrganizationVO() {
		super();
	}

	public OrganizationVO(String workerNickName, String signBoardName, String bossNickName) {
		super();
		this.workerNickName = workerNickName;
		this.signBoardName = signBoardName;
		this.bossNickName = bossNickName;
	}

	public String getWorkerNickName() {
		return workerNickName;
	}

	public void setWorkerNickName(String workerNickName) {
		this.workerNickName = workerNickName;
	}

	public String getSignBoardName() {
		return signBoardName;
	}

	public void setSignBoardName(String signBoardName) {
		this.signBoardName = signBoardName;
	}

	public String getBossNickName() {
		return bossNickName;
	}

	public void setBossNickName(String bossNickName) {
		this.bossNickName = bossNickName;
	}

	@Override
	public String toString() {
		return "OrganizationVO [workerNickName=" + workerNickName + ", signBoardName=" + signBoardName
				+ ", bossNickName=" + bossNickName + "]";
	}
}
