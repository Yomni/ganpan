package org.sync.ganpan.model.vo;

import java.util.List;

public class HaveBoardVO {
	private SignBoardVO signBoardVO;//signBoardName, bossMemberVO
	private BoardGenreVO boardGenreVO;
	private List<WorkVO> works; // 각 보드별로 work들이 존재
	public HaveBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HaveBoardVO(SignBoardVO signBoardVO, BoardGenreVO boardGenreVO, List<WorkVO> works) {
		super();
		this.signBoardVO = signBoardVO;
		this.boardGenreVO = boardGenreVO;
		this.works = works;
	}
	public SignBoardVO getSignBoardVO() {
		return signBoardVO;
	}
	public void setSignBoardVO(SignBoardVO signBoardVO) {
		this.signBoardVO = signBoardVO;
	}
	public BoardGenreVO getBoardGenreVO() {
		return boardGenreVO;
	}
	public void setBoardGenreVO(BoardGenreVO boardGenreVO) {
		this.boardGenreVO = boardGenreVO;
	}
	public List<WorkVO> getWorks() {
		return works;
	}
	public void setWorks(List<WorkVO> works) {
		this.works = works;
	}
	@Override
	public String toString() {
		return "HaveBoardVO [signBoardVO=" + signBoardVO + ", boardGenreVO=" + boardGenreVO + ", works=" + works + "]";
	}
	
	
}// class BoardGenreVO
