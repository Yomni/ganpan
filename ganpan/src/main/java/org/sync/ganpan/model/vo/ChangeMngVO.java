package org.sync.ganpan.model.vo;

public class ChangeMngVO {
	private int changeMngNo;
	private String changeWorker;
	private String changeMngDate;
	private int boardNo;
	private WorkVO workVO;// workNo
	private ChangeGenreVO changeGenreVO;// changeNo

	public ChangeMngVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChangeMngVO(int changeMngNo, String changeWorker, String changeMngDate, int boardNo, WorkVO workVO,
			ChangeGenreVO changeGenreVO) {
		super();
		this.changeMngNo = changeMngNo;
		this.changeWorker = changeWorker;
		this.changeMngDate = changeMngDate;
		this.boardNo = boardNo;
		this.workVO = workVO;
		this.changeGenreVO = changeGenreVO;
	}

	public int getChangeMngNo() {
		return changeMngNo;
	}

	public void setChangeMngNo(int changeMngNo) {
		this.changeMngNo = changeMngNo;
	}

	public String getChangeWorker() {
		return changeWorker;
	}

	public void setChangeWorker(String changeWorker) {
		this.changeWorker = changeWorker;
	}

	public String getChangeMngDate() {
		return changeMngDate;
	}

	public void setChangeMngDate(String changeMngDate) {
		this.changeMngDate = changeMngDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public WorkVO getWorkVO() {
		return workVO;
	}

	public void setWorkVO(WorkVO workVO) {
		this.workVO = workVO;
	}

	public ChangeGenreVO getChangeGenreVO() {
		return changeGenreVO;
	}

	public void setChangeGenreVO(ChangeGenreVO changeGenreVO) {
		this.changeGenreVO = changeGenreVO;
	}

	@Override
	public String toString() {
		return "ChangeMngVO [changeMngNo=" + changeMngNo + ", changeWorker=" + changeWorker + ", changeMngDate="
				+ changeMngDate + ", boardNo=" + boardNo + ", workVO=" + workVO + ", changeGenreVO=" + changeGenreVO
				+ "]";
	}

}// class ChangeMngVO
