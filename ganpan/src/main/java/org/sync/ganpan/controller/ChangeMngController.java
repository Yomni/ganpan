package org.sync.ganpan.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.sync.ganpan.model.service.ChangeMngService;

@Controller
public class ChangeMngController {
	@Resource
	private ChangeMngService changeMngService;
	
	@RequestMapping("change_mng.do")
	public String showChangeMng(String signBoardName, String bossNickName){
		System.out.println("ChangeMngController의 signBaordName 값 : "+signBoardName);
		System.out.println("ChangeMngController의 bossNickName 값 : "+bossNickName);
		
		return "board/change_mng";
	}
}//class ChangeMngController
