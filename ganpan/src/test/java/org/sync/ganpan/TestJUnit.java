package org.sync.ganpan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.sync.ganpan.model.dao.OrganizationDAO;
import org.sync.ganpan.model.dao.WorkDAO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.PagingBean;
import org.sync.ganpan.model.vo.SignBoardVO;

/*
 *    TDD : 테스트 주도 개발(test-driven development, TDD)은 
 *            매우 짧은 개발 사이클을 반복하는 소프트웨어 개발 프로세스
 *            
 *    JUnit: 자바 단위 테스트를 위한 TDD 프레임워크
 *    
 *    아래 라이브러리가 maven의 pom.xml에 추가되어야 한다. 
       <!-- spring junit  -->
  <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-test</artifactId>
            <version>${org.springframework-version}</version>            
        </dependency>
        <!-- Test : 기존 4.7에서 4.9로 수정 -->
  <dependency>
   <groupId>junit</groupId>
   <artifactId>junit</artifactId>
   <version>4.9</version>
   <scope>test</scope>
  </dependency>  
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class TestJUnit {
	@Resource
	private WorkDAO dao;

	@Resource
	private OrganizationDAO oDAO;
	@Resource
	private WorkDAO workDAO;
	
	@Test
	public void test() {
		Map<String, Object> map = new HashMap<String,Object>();
		SignBoardVO svo=new SignBoardVO("엄","kosta1");
		PagingBean pb=null;
		map.put("svo", svo);
		map.put("getStartRowNumber", 1);
		map.put("getEndRowNumber", 5);
		List<OrganizationVO> oList=oDAO.getOrganizationList(map);
		System.out.println(oList);
	}// method test

}//class TestJUnit
