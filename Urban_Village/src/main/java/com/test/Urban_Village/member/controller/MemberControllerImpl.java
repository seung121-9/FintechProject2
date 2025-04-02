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
@RequestMapping("/urban/member") // ȸ�� ���� ��û�� ���� �⺻ URL�� /urban/member�� ����
public class MemberControllerImpl implements MemberController {

	@Autowired
	MemberService service;

	// @Override
	// @RequestMapping("/main") // �� ������ �����մϴ�.
	// public ModelAndView main() {
	// 	ModelAndView mav = new ModelAndView("urbanMain");
	// 	return mav;
	// }

	@Override
	@RequestMapping("/list") // ȸ�� ��� URL�� /urban/member/list�� ����
	public ModelAndView listMembers() {
		List<MemberDTO> membersList = service.listMembers();
		ModelAndView mav = new ModelAndView("urbanMemberList");
		mav.addObject("membersList", membersList);
		return mav;
	}

	@Override
	@RequestMapping("/loginForm") // �α��� �� URL�� /urban/member/loginForm���� ����
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("urbanLogin");
		return mav;
	}

	@Override
	@RequestMapping(value = "/login", method = RequestMethod.POST) // �α��� ó�� URL�� /urban/member/login���� ����
	public ModelAndView login(@RequestParam("id") String id, @RequestParam("pwd") String pwd) {
		ModelAndView mav = new ModelAndView();
		MemberDTO member = service.login(id, pwd);
		if (member != null) {
			mav.setViewName("redirect:/urban/member/list"); // �α��� ���� �� ȸ�� ������� �����̷�Ʈ
		} else {
			mav.setViewName("urbanLogin");
			mav.addObject("error", "�߸��� �α��� �����Դϴ�.");
		}
		return mav;
	}

	@Override
	@RequestMapping("/joinForm") // ȸ�� ���� �� URL�� /urban/member/joinForm���� ����
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