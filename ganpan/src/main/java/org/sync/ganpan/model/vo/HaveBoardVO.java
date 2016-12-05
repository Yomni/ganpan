package org.sync.ganpan.model.vo;

import java.util.ArrayList;

public class HaveBoardVO {
	private SignBoardVO signBoardVO;//signBoardName, bossMemberVO
	private BoardGenreVO boardGenreVO;
	private ArrayList<WorkVO> works; // 각 보드별로 work들이 존재
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
