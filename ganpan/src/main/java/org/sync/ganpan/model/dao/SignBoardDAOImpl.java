package org.sync.ganpan.model.dao;

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

}
