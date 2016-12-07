package org.sync.ganpan.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.sync.ganpan.model.service.MemberService;
import org.sync.ganpan.model.service.SignBoardService;
import org.sync.ganpan.model.vo.MemberVO;
import org.sync.ganpan.model.vo.SignBoardVO;

/**
 * Member의 제어를 위한 Controller
 * @author JYM
 *
 */
@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	@Resource
	private SignBoardService signBoardService;

	/****************************************민영**********************************************/
	/**
	 * 회원 가입
	 * @author 민영
	 * @param mvo
	 */
	@RequestMapping(value = "register.do", method = RequestMethod.POST)
	public String registerMember(MemberVO mvo, HttpSession session) {
		memberService.registerMember(mvo);
		session.setAttribute("mvo", mvo);
		return "redirect:registerResultView.do?nickName=" + mvo.getNickName();
	}

	/**
	 * home화면에서 회원가입 실패 시 register.jsp로 넘겨주거나 성공시 성공화면으로 전송
	 * @author 용민
	 * @param mvo
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "register_main.do", method = RequestMethod.POST)
	public ModelAndView registerFromIndexMember(MemberVO mvo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		boolean nickNameLengthFlag = false;
		boolean nickNameDuplicateFlag = false;
		boolean eMailDuplicateFlag = false;
		boolean passwordLengthFlag = false;
		if(mvo.getNickName().trim().length() < 2 || mvo.getNickName().trim().length() > 15) {
			nickNameLengthFlag = true; // 길이 
		}
		if(memberService.nickNameCheck(mvo.getNickName()) != 0) { // nickName이 중복
			nickNameDuplicateFlag = true; // nickName 중복됨.
		}
		if(memberService.eMailCheck(mvo.geteMail()) != 0) {
			eMailDuplicateFlag = true;
		}
		if(mvo.getPassword().trim().length() < 6 || mvo.getPassword().trim().length() > 15) {
			passwordLengthFlag = true;
		}
		// 네가지 중 하나라도 true면
		if(nickNameLengthFlag || nickNameDuplicateFlag || eMailDuplicateFlag || passwordLengthFlag) {
			HashMap<String, Boolean> modelMap = new HashMap<String, Boolean>();
			modelMap.put("nickNameLengthFlag", nickNameLengthFlag);
			modelMap.put("nickNameDuplicateFlag", nickNameDuplicateFlag);
			modelMap.put("eMailDuplicateFlag", eMailDuplicateFlag);
			modelMap.put("passwordLengthFlag", passwordLengthFlag);
			mv.setViewName("member/register_form");
			mv.addAllObjects(modelMap);
			mv.addObject("mvo", mvo);
		} else {
			session.setAttribute("mvo", mvo); // login
			mv.setViewName("redirect:registerResultView.do?nickName=" + mvo.getNickName());
		}
		return mv;
	}

	/**
	 * 회원가입 결과화면으로 이동
	 * @author 민영
	 * @param nickName
	 */
	@RequestMapping("registerResultView.do")
	public ModelAndView registerResultView(String nickName) {
		MemberVO mvo = memberService.findMemberByNickName(nickName);
		return new ModelAndView("member/register_result", "mvo", mvo);
	}

	/**
	 * 회원가입 시 이메일 중복확인
	 * @author 민영
	 * @param eMail
	 */
	@RequestMapping("eMailCheckAjax.do")
	@ResponseBody
	public String eMailCheckAjax(String eMail) {
		int count = memberService.eMailCheck(eMail);
		return (count == 0) ? "ok" : "fail";
	}

	/**
	 * 회원가입 시 닉네임 중복확인
	 * @author 민영
	 */
	@RequestMapping("nickNameCheckAjax.do")
	@ResponseBody
	public String nickNameCheckAjax(String nickName) {
		int count = memberService.nickNameCheck(nickName);
		return (count == 0) ? "ok" : "fail";
	}

	/******************************************************************************************/
	
	/**
	 * 그룹원 초대 시 닉네임, 이메일 확인
	 * @param id
	 * @author 주선, 민영
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST, value="idCheckAjax.do")
	@ResponseBody
	public boolean idCheckAjax(String id){
		int count = memberService.idCheck(id);
		System.out.println(count);
		// count가 0이면 해당 회원이 없음
		return (count == 0) ? true : false;
	}

	/******************************** 주선 **********************************/
	/**
	 * 회원 로그인
	 * @author 주선
	 * @param request
	 * @param id
	 * @param password
	 */
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(HttpSession session, String id, String password) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", password);
		MemberVO mvo = memberService.login(map);
		System.out.println("login: " +mvo);
		if (mvo != null) {
			session.setAttribute("mvo", mvo);
			List<SignBoardVO> slist = signBoardService.allSignBoardList(mvo.getNickName());
			System.out.println(slist);
			session.setAttribute("slist", slist);
			return "redirect:homeSignBoardList.do";
		} else {
			return "redirect:go_member/login_fail.do";
		}
	}

	/**
	 * 회원 로그아웃
	 * @author 주선
	 * @param request
	 */
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:go_home.do";
	}

	/************************************************************************/

	/**
	 * 회원 정보 수정
	 * @author 주선,민영
	 */
	@RequestMapping(value = "updateMember.do", method = RequestMethod.POST)
	public String updateMember(HttpSession session, MemberVO mvo) {
		memberService.updateMember(mvo);
		session.setAttribute("mvo", mvo);
		return "redirect:go_member/left_template/my_info.do";
	}
}
