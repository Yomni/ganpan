package org.sync.ganpan.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.sync.ganpan.model.vo.HaveBoardVO;
import org.sync.ganpan.model.vo.SignBoardVO;

@Repository
public class HaveBoardDAOImpl implements HaveBoardDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public List<HaveBoardVO> getHaveBoardList(SignBoardVO svo) {
		return template.selectList("haveBoard.getHaveBoardList");
	}
	
	@Override
	public void createNewGanpan(HashMap<String, Object> map) {
		template.insert("haveBoard.createNewGanpan", map);
	}

}
