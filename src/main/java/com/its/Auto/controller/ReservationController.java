package com.its.Auto.controller;

import com.its.Auto.dto.ReservationDTO;
import com.its.Auto.dto.member_resDTO;
import com.its.Auto.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
    @Autowired
    private ReservationService reservationService;

    @GetMapping("/save")
    public String saveform(){return "/reservation/ResSave"; }

    @PostMapping("/save")
    public String save(@ModelAttribute ReservationDTO reservationDTO){

        reservationService.save(reservationDTO);
        return "index";
    }
    @GetMapping("/reservation")
    public String detail(@RequestParam Long resId,Model model){
       member_resDTO DTO= reservationService.detail(resId);
        System.out.println(resId);
        System.out.println("DTO = " + DTO);
       model.addAttribute("detail",DTO);
       return "/reservation/ResDetail";
    }


}
