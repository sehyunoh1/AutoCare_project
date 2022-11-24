package com.its.Auto.controller;

import com.its.Auto.dto.MemberDTO;
import com.its.Auto.dto.PagingDTO;
import com.its.Auto.dto.ReservationDTO;
import com.its.Auto.dto.member_resDTO;
import com.its.Auto.service.MemberService;
import com.its.Auto.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    @GetMapping("/member/delete")
    public String delete(@RequestParam Long id){
                memberService.delete(id);
        return "redirect:/admin/member";
    }
    @GetMapping("/reservation")
    public String reservation(Model model,@RequestParam(value="page",required = false,defaultValue = "1") int page){
        List<member_resDTO> reservationList = reservationService.list(page);
        PagingDTO pagingDTO = reservationService.pagingParam(page);
        model.addAttribute(("resList"),reservationList);
        model.addAttribute(("pagingDTO"),pagingDTO);
        return "/admin/reservation";
    }
}
