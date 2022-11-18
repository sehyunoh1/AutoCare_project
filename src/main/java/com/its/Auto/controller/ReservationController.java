package com.its.Auto.controller;

import com.its.Auto.dto.ReservationDTO;
import com.its.Auto.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
    @Autowired
    private ReservationService reservationService;

    @GetMapping("/save")
    public String saveform(){return "/reservation/ResSave"; }

    @PostMapping("/save")
    public String save(@ModelAttribute ReservationDTO reservationDTO){
        System.out.println("reservationDTO = " + reservationDTO);
        return null;
    }
}
