package org.sync.ganpan.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.sync.ganpan.model.service.GroupService;
import org.sync.ganpan.model.service.WorkService;
import org.sync.ganpan.model.vo.InvitationMngVO;
import org.sync.ganpan.model.vo.MemberVO;
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
	private GroupService groupService;
	@Resource
	private WorkService workService;
	
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
	public String inviteWorker(String signBoardName, String bossNickName, String id,String type){
		//id는 이메일이나 닉네임
		if(type=="email"){
			id=groupService.getNickNameByEmail(id);
		}
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
		return "redirect: ";
	}

	/**
	 * 구성원 보기
	 * @author 민서, 동혁
	 */
	@RequestMapping("group_member_list.do")
	public ModelAndView getGroupList(HttpServletRequest request) {
		String signBoardName=request.getParameter("signBoardName");
		String bossNickName=request.getParameter("bossNickName");
		SignBoardVO svo = new SignBoardVO(signBoardName, bossNickName);//ganpan1, kosta1
		List<OrganizationVO> oList = groupService.getGroupList(svo);
		
		
		return new ModelAndView("board/left_template/group_member_list","oList", oList);
	}
	@RequestMapping("banish.do")
	public String banish(HttpServletRequest request){
		String workerNickName=request.getParameter("workerNickName");
		String signBoardName=request.getParameter("signBoardName");
		String bossNickName=request.getParameter("bossNickName");
		MemberVO workerNickNameVO=new MemberVO(workerNickName);
		SignBoardVO signBoardVO=new SignBoardVO(signBoardName,bossNickName);
		OrganizationVO ovo=new OrganizationVO(workerNickNameVO,signBoardVO);
		System.out.println("GroupController : "+ovo);
		//그룹에서 강제퇴장!
		groupService.banish(ovo);
		
		//다시 getGroupList로 보내줘야 한다.
		return "redirect:group_member_list.do?signBoardName="+signBoardName+"&bossNickName="+bossNickName;
	}
	
	
	
}//class GroupController





