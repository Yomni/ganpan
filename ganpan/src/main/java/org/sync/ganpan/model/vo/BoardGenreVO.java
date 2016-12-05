package org.sync.ganpan.model.vo;

public class BoardGenreVO {
	private String boardNo;
	private String boardName;
	public BoardGenreVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardGenreVO(String boardNo, String boardName) {
		super();
		this.boardNo = boardNo;
		this.boardName = boardName;
	}
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
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
		return "BoardGenre [boardNo=" + boardNo + ", boardName=" + boardName + "]";
	}
	
	
}//class BoardGenre
