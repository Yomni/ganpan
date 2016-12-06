package org.sync.ganpan.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.sync.ganpan.model.service.SignBoardService;
import org.sync.ganpan.model.vo.HaveBoardVO;
import org.sync.ganpan.model.vo.InvitationMngVO;
import org.sync.ganpan.model.vo.MemberVO;
import org.sync.ganpan.model.vo.SignBoardVO;

/**
 * 간판을 위해 설정하는 Controller
 * @author JYM
 *
 */
@Controller
public class SignBoardController {
	@Resource
	SignBoardService signBoardService;

	/**
	 * 칸반 검색
	 * @author 주선
	 */
	@RequestMapping("findSignBoardListByTitle.do")
	public ModelAndView findSignBoardListByTitle(String title) {
		List<SignBoardVO> sbList = signBoardService.findSignBoardListByTitle(title);
		if (sbList.isEmpty())
			return new ModelAndView("board/search_result_fail");
		else
			return new ModelAndView("board/search_result", "sbList", sbList);
	}

	/**
	 * 새 간판 생성하기
	 * @author 민영
	 */
	@RequestMapping("createNewGanpan.do")
	public ModelAndView createNewGanpan(HttpSession session, String title, String ganpanType) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bossNickName", mvo.getNickName());
		map.put("signBoardName", title);
		if (ganpanType.equals("public")) {// 간판 공개시 visibility default 0
			map.put("visibility", 0);
			signBoardService.createNewGanpan(map);
		} else {
			map.put("visibility", 1);
			signBoardService.createNewGanpan(map);
		}
		return new ModelAndView("board/search_result");
	}

	/**
	 * 간판 생성시
	 * 소유자의 소유칸판 중 중복되는 타이틀이 있는지 확인
	 * @author 민영
	 */
	@ResponseBody
	@RequestMapping("titleCheckAjax.do")
	public String titleCheckAjax(String title, HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("bossNickName", mvo.getNickName());
		map.put("signBoardName", title);
		int count = signBoardService.titleCheck(map);
		return (count == 0) ? "ok" : "fail";
	}

	/**
	 * 소유 간판 보기
	 * @author 주선, 민영
	 */
	@RequestMapping("mySignBoardList.do")
	public ModelAndView mySignBoardList(HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		List<SignBoardVO> sbList = signBoardService.mySignBoardList(mvo.getNickName());
		if (sbList.isEmpty())
			return new ModelAndView("member/left_template/my_ganpan_list_fail");
		else
			return new ModelAndView("member/left_template/my_ganpan_list", "sbList", sbList);
	}

	/**
	 * 참여 간판 보기
	 * @author 주선, 민영
	 */
	@RequestMapping("myJoinSignBoardList.do")
	public ModelAndView myJoinSignBoardList(HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		List<SignBoardVO> sbList = signBoardService.myJoinSignBoardList(mvo.getNickName());
		if (sbList.isEmpty())
			return new ModelAndView("member/left_template/my_join_ganpan_list_fail");
		else
			return new ModelAndView("member/left_template/my_join_ganpan_list", "sbList", sbList);
	}

	/**
	 * 홈에서 보여지는
	 * 간판 리스트 보기(all, public, private)
	 * @author 주선, 민영
	 */
	@RequestMapping("homeSignBoardList.do")
	public ModelAndView homeSignBoardList(HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		String nickName = mvo.getNickName();
		HashMap<String, List> sbMap = signBoardService.homeSignBoardList(nickName);
		return new ModelAndView("home", "sbMap", sbMap);
	}

	/**
	 * 간판 내용 보기(작업들)
	 * @author 동혁
	 * @param session
	 * @return
	 */
	@RequestMapping("showGanpan.do")
	public ModelAndView showGanpan(HttpSession session, HttpServletRequest request) {
		String signBoardName = request.getParameter("signBoardName");
		String bossNickName = request.getParameter("bossNickName");
		SignBoardVO svo = new SignBoardVO(signBoardName,bossNickName);
		SignBoardVO rsvo = signBoardService.showGanpan(svo);
		
		return new ModelAndView("board/ganpan","rsvo",rsvo);
	}

	/**
	 * ganpan_setting 페이지로 해당 간판 정보를 가지고 이동
	 * @param signBoardName
	 * @param bossNickName
	 * @return
	 */
	@RequestMapping("ganpanSettingPage.do")
	public ModelAndView ganpanSettingPage(String signBoardName, String bossNickName) {
		SignBoardVO svo = new SignBoardVO(signBoardName, bossNickName);
		System.out.println("1"+svo);

		SignBoardVO svo2 = signBoardService.ganpanSettingPage(svo);
		System.out.println("2"+svo2);
		return new ModelAndView("board/left_template/ganpan_setting", "svo", svo2);
	}

	/**
	 * 간판 이름 수정하기
	 * @author 주선, 민영
	 * @return
	 */
	@RequestMapping("updateSignBoardName.do")
	public ModelAndView updateSignBoardName(String changeTitle, String signBoardName, String bossNickName) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("changeTitle", changeTitle);
		map.put("signBoardName", signBoardName);
		map.put("bossNickName", bossNickName);
		// signBoardService.updateSignBoardName(map);

		return new ModelAndView("");
	}

	/**
	 * 초대 현황 리스트 보기
	 * @author 주선, 민영
	 * @param session
	 * @return
	 */
	@RequestMapping("invitationList.do")
	public ModelAndView invitationList(HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		List<InvitationMngVO> inviteList = signBoardService.invitationList(mvo.getNickName());
		if (inviteList.size() == 0)
			return new ModelAndView("member/left_template/invitation_list_fail");
		else
			return new ModelAndView("member/left_template/invitation_list", "inviteList", inviteList);
	}

	/**
	 * 초대 수락시 그룹에 추가, 초대 이력에서 제거
	 * @author 주선, 민영
	 * @param signBoardName
	 * @param bossNickName
	 * @param session
	 * @return
	 */
	@RequestMapping("acceptInvitation.do")
	public String acceptInvitaton(String signBoardName, String bossNickName, HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		String nickname = mvo.getNickName();
		InvitationMngVO ivo = new InvitationMngVO(signBoardName, bossNickName, nickname);
		signBoardService.addOrganization(ivo);
		signBoardService.deleteInvitationMng(ivo);
		return "redirect:invitationList.do";
	}

	/**
	 * 초대 거절 시, 초대 이력에서 제거
	 * @author 주선, 민영
	 * @param signBoardName
	 * @param bossNickName
	 * @param session
	 * @return
	 */
	@RequestMapping("rejectInvitation.do")
	public String rejectInvitation(String signBoardName, String bossNickName, HttpSession session) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		String nickname = mvo.getNickName();
		InvitationMngVO ivo = new InvitationMngVO(signBoardName, bossNickName, nickname);
		signBoardService.deleteInvitationMng(ivo);
		return "redirect:invitationList.do";
	}

}// class
