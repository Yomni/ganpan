package org.sync.ganpan.model.vo;

/**
 * Table schema가 올 예정
 * @author JYM
 *
 */
public class ChangeGenreVO {
	private int changeNo;
	private String changeName;

	public ChangeGenreVO() {
		super();
	}

	public ChangeGenreVO(int changeNo, String changeName) {
		super();
		this.changeNo = changeNo;
		this.changeName = changeName;
	}

	public int getChangeNo() {
		return changeNo;
	}

	public void setChangeNo(int changeNo) {
		this.changeNo = changeNo;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	@Override
	public String toString() {
		return "ChangeGenreVO [changeNo=" + changeNo + ", changeName=" + changeName + "]";
	}
}
