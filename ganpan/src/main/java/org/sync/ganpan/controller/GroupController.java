package org.sync.ganpan.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.sync.ganpan.model.service.GroupService;
import org.sync.ganpan.model.vo.InvitationMngVO;
import org.sync.ganpan.model.vo.SignBoardVO;

/**
 * Group의 제어를 위한 Controller
 * @author JYM
 *
 */
@Controller
public class GroupController {
	@Resource
	private GroupService groupService;
	
	/**
	 * 
	 * @param bossNickName
	 * @param signBoardName
	 * @return
	 */
	@RequestMapping("inviteGroupMemberPage.do")
	public ModelAndView inviteGroupMemberPage(String bossNickName, String signBoardName){
		SignBoardVO svo=new SignBoardVO(signBoardName, bossNickName);
		return new ModelAndView("board/left_template/invite_group_member","svo",svo);
	}
	
	/**
	 * 그룹원을 초대
	 * @author 주선, 민영
	 */
	@RequestMapping("inviteWorker.do")
	public String inviteWorker(String signBoardName, String bossNickName, String id){
		//id는 이메일이나 닉네임
		InvitationMngVO ivo=new InvitationMngVO(signBoardName, bossNickName, id);
		groupService.inviteWorker(ivo);
		return "redirect: ";
	}
	
	/**
	 * 그룹장이 보낸 초대를 취소함
	 * @author 민영
	 * @param signBoardName
	 * @param bossNickName
	 * @param nickName
	 * @return
	 */
	@RequestMapping("cancelInvitation.do")
	public String cancelInvitation(String signBoardName, String bossNickName, String nickName){
		InvitationMngVO ivo=new InvitationMngVO(signBoardName, bossNickName, nickName);
		groupService.cancelInvitation(ivo);
		return "redirect:";
	}
}
