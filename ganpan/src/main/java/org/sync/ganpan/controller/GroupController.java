package org.sync.ganpan.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.sync.ganpan.model.service.GroupService;
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
	public String inviteWorker(RedirectAttributes redirectAttributes, String signBoardName, String bossNickName, String id, String type){
		//id는 이메일이나 닉네임
		System.out.println("inviteWorker:signBoardName: " + signBoardName);
		System.out.println("inviteWorker:email: " + type);
		System.out.println("inviteWorker:email: " + type);
		System.out.println("inviteWorker:email: " + type);
		if(type.equals("email")){
			id=groupService.getNickNameByEmail(id);
			System.out.println("inviteWorker:email: " + type);
		}
		InvitationMngVO ivo=new InvitationMngVO(signBoardName, bossNickName, id);
		System.out.println("inviteWorker:ivo: " + ivo);
		groupService.inviteWorker(ivo);
		redirectAttributes.addAttribute("signBoardName", signBoardName);
		redirectAttributes.addAttribute("bossNickName", bossNickName);
		return "redirect:sendInvitationList.do";
	}
	
	/**
	 * 그룹장이 초대장을 보낸 리스트 보기
	 * @author 주선, 민영
	 * @param redirectAttributes
	 * @param signBoardName
	 * @param bossNickName
	 * @return
	 */
	@RequestMapping("sendInvitationList.do")
	public ModelAndView sendInvitationList(String signBoardName, String bossNickName){
		ModelAndView mv = new ModelAndView();
		SignBoardVO svo=new SignBoardVO(signBoardName, bossNickName);
		List<HashMap<String, String>> MList = groupService.sendInvitationList(svo);
		mv.setViewName("board/left_template/invite_group_member");
		mv.addObject("MList", MList);
		mv.addObject("svo", svo);
		return mv;
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
	public String cancelInvitation(RedirectAttributes redirectAttributes, String signBoardName, String bossNickName, String nickName){
		InvitationMngVO ivo=new InvitationMngVO(signBoardName, bossNickName, nickName);
		System.out.println("cancelInvitation:ivo: "+ivo);
		groupService.cancelInvitation(ivo);
		redirectAttributes.addAttribute("signBoardName", signBoardName);
		redirectAttributes.addAttribute("bossNickName", bossNickName);
		return "redirect:sendInvitationList.do";
	}
	
	
	@RequestMapping("leaveOrganization.do")
	public String leaveOrganization(String signBoardName, String bossNickName, HttpSession session){
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		String workerNickName= mvo.getNickName();
		OrganizationVO ovo=new OrganizationVO(workerNickName,signBoardName,bossNickName);
		groupService.leaveOrganization(ovo);
		return "redirect:";
		
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
		System.out.println("GroupController svo : "+svo);
		
		List<OrganizationVO> oList = groupService.getGroupList(svo);
		for(int i=0; i<oList.size(); i++){
			System.out.println("------GroupController oList값----------------");
			System.out.println(oList.get(i).toString());
		}
		
		return new ModelAndView("board/group_member_list","oList", oList);
	}
	
}//class GroupController





