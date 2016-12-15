package org.sync.ganpan;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.sync.ganpan.model.dao.ChangeMngDAO;
import org.sync.ganpan.model.dao.OrganizationDAO;
import org.sync.ganpan.model.dao.WorkDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class TestJUnitJYM {
	@Resource
	private WorkDAO wDAO;
	@Resource
	private OrganizationDAO oDAO;
	@Resource
	private ChangeMngDAO cdao;
	@Resource
	private WorkDAO workDAO;

	@Test
	public void test() {
		
	}// method test

}// class TestJUnit
