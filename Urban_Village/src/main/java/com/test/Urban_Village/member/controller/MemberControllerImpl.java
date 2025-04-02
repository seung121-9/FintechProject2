package com.test.Urban_Village.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.Urban_Village.member.dto.MemberDTO;
import com.test.Urban_Village.member.service.MemberService;
import com.test.Urban_Village.member.service.MemberServiceImpl;

@Controller
@RequestMapping("/urban/member") // 회원 관련 요청에 대한 기본 URL을 /urban/member로 변경
public class MemberControllerImpl implements MemberController {

	@Autowired
	MemberService service;

	// @Override
	// @RequestMapping("/main") // 이 매핑을 제거합니다.
	// public ModelAndView main() {
	// 	ModelAndView mav = new ModelAndView("urbanMain");
	// 	return mav;
	// }

	@Override
	@RequestMapping("/list") // 회원 목록 URL을 /urban/member/list로 변경
	public ModelAndView listMembers() {
		List<MemberDTO> membersList = service.listMembers();
		ModelAndView mav = new ModelAndView("urbanMemberList");
		mav.addObject("membersList", membersList);
		return mav;
	}

	@Override
	@RequestMapping("/loginForm") // 로그인 폼 URL을 /urban/member/loginForm으로 변경
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("urbanLogin");
		return mav;
	}

	@Override
	@RequestMapping(value = "/login", method = RequestMethod.POST) // 로그인 처리 URL을 /urban/member/login으로 변경
	public ModelAndView login(@RequestParam("id") String id, @RequestParam("pwd") String pwd) {
		ModelAndView mav = new ModelAndView();
		MemberDTO member = service.login(id, pwd);
		if (member != null) {
			mav.setViewName("redirect:/urban/member/list"); // 로그인 성공 시 회원 목록으로 리다이렉트
		} else {
			mav.setViewName("urbanLogin");
			mav.addObject("error", "잘못된 로그인 정보입니다.");
		}
		return mav;
	}

	@Override
	@RequestMapping("/joinForm") // 회원 가입 폼 URL을 /urban/member/joinForm으로 변경
	public ModelAndView joinMember() {
		ModelAndView mav = new ModelAndView("urbanJoin");
		return mav;
	}

	@Override
	public ModelAndView main() {
		// TODO Auto-generated method stub
		return null;
	}
}