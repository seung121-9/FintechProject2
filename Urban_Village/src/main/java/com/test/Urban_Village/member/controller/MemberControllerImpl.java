package com.test.Urban_Village.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.Urban_Village.member.dto.MemberDTO;
import com.test.Urban_Village.member.service.MemberService;
import com.test.Urban_Village.member.service.MemberServiceImpl;

@Controller
@RequestMapping("/member")
public class MemberControllerImpl implements MemberController {
   
   @Autowired
   MemberService service;
    
   
   @Override
    @RequestMapping("/memberList.do")
    public ModelAndView listMembers() {
        List<MemberDTO> membersList = service.listMembers();
        ModelAndView mav = new ModelAndView("member/urbanMemberList");
      mav.addObject("membersList", membersList);
      return mav;
    }
   @Override
    @RequestMapping("/urbanLogin.do")
    public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) {
      String viewName = (String) request.getAttribute("viewName");
      ModelAndView mav = new ModelAndView();
      mav.setViewName(viewName);
      mav.addObject("viewName",viewName);
      System.out.println("viewName"+viewName);
      return   mav;
    }
   @Override
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public ModelAndView login(@RequestParam("id") String id, @RequestParam("pwd") String pwd) {
        ModelAndView mav = new ModelAndView();
        // 로그인 서비스에서 아이디와 비밀번호 확인
        MemberDTO member = service.login(id, pwd);
        if (member != null) {
            mav.setViewName("redirect:/member/memberList.do"); 
        } else {
            mav.setViewName("member/urbanLogin");
            mav.addObject("error", "잘못된 로그인 정보입니다.");
        }
        return mav;
    }
   
   @Override
   @RequestMapping("/joinMember.do")
   public ModelAndView joinMember(HttpServletRequest request, HttpServletResponse response) {
       // viewName이 설정되지 않았을 경우 기본값을 설정
       String viewName = (String) request.getAttribute("viewName");
       if (viewName == null) {
           viewName = "member/joinMember"; // 기본 이동할 뷰 이름 설정 (JSP 파일 경로)
       }

       ModelAndView mav = new ModelAndView();
       mav.setViewName(viewName);
       mav.addObject("viewName", viewName);
       System.out.println("viewName: " + viewName);
       
       return mav;
   }
   @RequestMapping(value = "/addMember.do", method = RequestMethod.POST)
   public ModelAndView addMember(@ModelAttribute MemberDTO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
       int result = service.addMember(member);
       System.out.println("Insert Result: " + result);
       response.setContentType("text/html;charset=utf-8");
       PrintWriter out = response.getWriter();

       if (result == 1) {
           out.write("<script>");
           out.write("alert('회원 가입에 성공했습니다!');");
           out.write("location.href='/Urban_Village/member/urbanLogin.do';");
           out.write("</script>");
       } else {
           out.write("<script>");
           out.write("alert('회원 가입에 실패했습니다. 다시 시도해주세요.');");
           out.write("location.href='/Urban_Village/member/joinMember.do';");
           out.write("</script>");
       }
       return null;
   }
   


}
