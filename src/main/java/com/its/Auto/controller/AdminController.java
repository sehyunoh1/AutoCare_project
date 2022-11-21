package com.its.Auto.controller;

import com.its.Auto.dto.MemberDTO;
import com.its.Auto.dto.ReservationDTO;
import com.its.Auto.dto.member_resDTO;
import com.its.Auto.service.MemberService;
import com.its.Auto.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private ReservationService reservationService;

    @GetMapping("/member")
    public String member(Model model){
        List<MemberDTO> memberList =memberService.memberList();
        model.addAttribute("memberList",memberList);
        return "/admin/member";
    }
    @GetMapping("/reservation")
    public String reservation(Model model){
        List<member_resDTO> reservationList = reservationService.list();
        model.addAttribute(("resList"),reservationList);
        return "/admin/reservation";
    }
}
