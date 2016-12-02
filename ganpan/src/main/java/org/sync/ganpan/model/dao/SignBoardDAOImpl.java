package org.sync.ganpan.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.sync.ganpan.model.vo.SignBoardVO;

@Repository
public class SignBoardDAOImpl implements SignBoardDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public List<SignBoardVO> findSignBoardListByTitle(String title) {
		List<SignBoardVO> sbList = template.selectList("signBoard.findSignBoardListByTitle", title);
		System.out.println("DAOImpl: "+sbList);
		return sbList;
	}

	@Override
	public int titleCheck(HashMap<String, String> map) {
		return template.selectOne("signBoard.titleCheck",map);
	}

	@Override
	public void createNewGanpan(HashMap<String, Object> map) {
		template.insert("signBoard.createNewGanpan",map);
	}

	@Override
	public List<SignBoardVO> allSignBoardList(String nickName) {
		return template.selectList("signBoard.allSignBoardList", nickName);
	}

	@Override
	public List<SignBoardVO> mySignBoardList(String nickName) {
		return template.selectList("signBoard.mySignBoardList", nickName);
	}

	@Override
	public List<SignBoardVO> myJoinSignBoardList(String nickName) {
		return template.selectList("signBoard.myJoinSignBoardList", nickName);
	}

	@Override
	public List<SignBoardVO> myPublicSignBoardList(String nickName) {
		return template.selectList("signBoard.myPublicSignBoardList", nickName);
	}

	@Override
	public List<SignBoardVO> myPublicJoinSignBoardList(String nickName) {
		return template.selectList("signBoard.myPublicJoinSignBoardList", nickName);
	}

	@Override
	public List<SignBoardVO> myPrivateSignBoardList(String nickName) {
		return template.selectList("signBoard.myPrivateSignBoardList", nickName);
	}

	@Override
	public List<SignBoardVO> myPrivateJoinSignBoardList(String nickName) {
		return template.selectList("signBoard.myPrivateJoinSignBoardList", nickName);
	}

	@Override
	public List<SignBoardVO> showContentList(SignBoardVO svo) {
		return template.selectList("signBoard.showContentList",svo);
	}
	

}//class
