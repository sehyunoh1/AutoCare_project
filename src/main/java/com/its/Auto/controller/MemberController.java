package com.its.Auto.controller;

import com.its.Auto.dto.MemberDTO;
import com.its.Auto.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String saveform(){return "/member/save";}

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO){
        System.out.println("memberDTO = " + memberDTO);
        memberService.save(memberDTO);
        return "/member/login";
    }
    @PostMapping("/duplicate")
    public @ResponseBody String emailCk(String memberEmail){
        String result = memberService.emailCk(memberEmail);
        if(result == null) {
            return "ok";
        } else {
            return "no";
        }
    }
    @GetMapping("/login")
    public String loginform(){return "/member/login";}

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session, Model model){
      MemberDTO result=  memberService.login(memberDTO);
      session.setAttribute("member",result);
      model.addAttribute(("member"),result);
        if(result != null) {
          return "index";
      }else {
            return "/member/login";
        }
    }
    @GetMapping("/member")
    public String detail(Long id,Model model){
        MemberDTO member = memberService.detail(id);
        model.addAttribute("member",member);
        return "/member/member";
    }
    @GetMapping("/update")
    public String update(){ return "/member/update";}
}
