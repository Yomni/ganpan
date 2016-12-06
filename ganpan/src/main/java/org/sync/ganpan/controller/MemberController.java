package org.sync.ganpan.controller;

import java.util.HashMap;

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
import org.sync.ganpan.model.vo.MemberVO;

/**
 * Member의 제어를 위한 Controller
 * @author JYM
 *
 */
@Controller
public class MemberController {
	@Resource
	private MemberService memberService;

	/****************************************민영**********************************************/
	/**
	 * 회원 가입
	 * @author 민영
	 * @param mvo
	 */
	@RequestMapping(value = "register.do", method = RequestMethod.POST)
	public String registerMember(MemberVO mvo, HttpServletRequest request) {
		memberService.registerMember(mvo);
		request.getSession().setAttribute("mvo", mvo);
		return "redirect:registerResultView.do?nickName=" + mvo.getNickName();
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

	/******************************** 주선 **********************************/
	/**
	 * 회원 로그인
	 * @author 주선
	 * @param request
	 * @param id
	 * @param password
	 */
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(HttpServletRequest request, String id, String password) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", password);
		MemberVO mvo = memberService.login(map);
		System.out.println(mvo);
		System.out.println("-------------------");
		if (mvo != null) {
			request.getSession().setAttribute("mvo", mvo);
			return "redirect:home_login.do";
		} else {
			return "redirect:member/login_fail.do";
		}
	}

	/**
	 * 회원 로그아웃
	 * @author 주선
	 * @param request
	 */
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null)
			session.invalidate();
		return "redirect:go_home.do";
	}

	/************************************************************************/

	/**
	 * 회원 정보 수정
	 * @author 주선,민영
	 */
	@RequestMapping(value = "updateMember.do", method = RequestMethod.POST)
	public String updateMember(HttpServletRequest request, MemberVO mvo) {
		int check = memberService.updateMember(mvo);
		System.out.println(check);
		request.getSession().setAttribute("mvo", mvo);
		// return "registerResultView.do?nickName=" + mvo.getNickName();
		System.out.println("updateMember method mvo.getNickName() : " + mvo.getNickName());
		return "redirect:member/my_info.do";
	}
}
