package org.sync.ganpan.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.sync.ganpan.model.service.GroupService;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.SignBoardVO;

/**
 * Group의 제어를 위한 Controller
 * @author JYM
 *
 */
@Controller
public class GroupController {
	@Resource
	GroupService groupService;

	/**
	 * 구성원 보기
	 * @author 민서, 동혁
	 */
	@RequestMapping("group_member_list.do")
	public ModelAndView getGroupList(HttpServletRequest request) {
		String signBoardName=request.getParameter("signBoardName");
		String bossNickName=request.getParameter("bossNickName");
		SignBoardVO svo = new SignBoardVO(signBoardName, bossNickName);//ganpan1, kosta1
		System.out.println("SignBoardController svo : "+svo);
		
		List<OrganizationVO> oList = groupService.getGroupList(svo);
		System.out.println("oList"+oList);
		return new ModelAndView("board/group_member_list","svo", oList);
	}
	
	
	
	
}
