package com.its.Auto.controller;

import com.its.Auto.dto.MemberDTO;
import com.its.Auto.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
}
