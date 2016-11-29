package org.sync.ganpan.model.vo;

public class BoardGenreVO {
	private SignBoardVO signBoardVO;//signBoardName, bossMemberVO
	private int boardNo;
	private String boardName;

	public BoardGenreVO(SignBoardVO signBoardVO, int boardNo, String boardName) {
		super();
		this.signBoardVO = signBoardVO;
		this.boardNo = boardNo;
		this.boardName = boardName;
	}

	public SignBoardVO getSignBoardVO() {
		return signBoardVO;
	}

	public void setSignBoardVO(SignBoardVO signBoardVO) {
		this.signBoardVO = signBoardVO;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	@Override
	public String toString() {
		return "BoardGenreVO [signBoardVO=" + signBoardVO + ", boardNo=" + boardNo + ", boardName=" + boardName + "]";
	};

}// class BoardGenreVO
