package org.sync.ganpan.model.dao;

import java.util.HashMap;
import java.util.List;

import org.sync.ganpan.model.vo.WorkVO;

public interface WorkDAO {

	List<WorkVO> getWorkList(HashMap<String, String> map);

}//interface WorkDAO