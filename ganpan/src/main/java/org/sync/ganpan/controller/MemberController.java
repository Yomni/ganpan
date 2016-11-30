package org.sync.ganpan.controller;

import javax.annotation.Resource;
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
	@RequestMapping(value = "register.do", method = RequestMethod.POST)
	public String register(MemberVO mvo) {
		memberService.register(mvo);
		return "redirect:registerResultView.do?email=" + mvo.geteMail();
	}
	
	@RequestMapping("registerResultView.do")
	public ModelAndView registerResultView(String email) {
		MemberVO mvo = memberService.findMemberByEmail(email);
		return new ModelAndView("register_result", "memberVO", mvo);
	}
	
	@RequestMapping("emailCheckAjax.do")
	@ResponseBody
	public String eMailCheckAjax(String eMail) {
		int count = memberService.eMailCheck(eMail);
		return (count == 0) ? "ok" : "fail";
	}
	
	@RequestMapping("nickNameCheckAjax.do")
	@ResponseBody
	public String nickNameCheckAjax(String nickName) {
		int count = memberService.nickNameCheck(nickName);
		return (count == 0) ? "ok" : "fail";
	}
	
/******************************************************************************************/
	
}


	