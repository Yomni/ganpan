package org.sync.ganpan.model.vo;

public class HaveBoardVO {
	private SignBoardVO signBoardVO;//signBoardName, bossMemberVO
	private BoardGenreVO boardGenreVO;
	public HaveBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HaveBoardVO(SignBoardVO signBoardVO, BoardGenreVO boardGenreVO) {
		super();
		this.signBoardVO = signBoardVO;
		this.boardGenreVO = boardGenreVO;
	}
	
	public SignBoardVO getSignBoardVO() {
		return signBoardVO;
	}
	public void setSignBoardVO(SignBoardVO signBoardVO) {
		this.signBoardVO = signBoardVO;
	}
	public BoardGenreVO getBoardGenre() {
		return boardGenreVO;
	}
	public void setBoardGenre(BoardGenreVO boardGenreVO) {
		this.boardGenreVO = boardGenreVO;
	}
	@Override
	public String toString() {
		return "Have_Board [signBoardVO=" + signBoardVO + ", boardGenreVO=" + boardGenreVO + "]";
	}
	

}// class BoardGenreVO
