package org.sync.ganpan.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.sync.ganpan.model.vo.HaveBoardVO;

@Repository
public class HaveBoardDAOImpl implements HaveBoardDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<HaveBoardVO> getHaveBoardList() {
		return sqlSessionTemplate.selectList("haveBoard.getHaveBoardList");
	}

}
