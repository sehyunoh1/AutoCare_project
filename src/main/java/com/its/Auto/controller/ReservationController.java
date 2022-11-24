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
       model.addAttribute("detail",DTO);
       return "/reservation/ResDetail";
    }
    @GetMapping("/fin")
    public String fin(@RequestParam Long resId,@RequestParam String fin, Model model){
       member_resDTO finish = new member_resDTO();
       finish.setFin(fin);
       finish.setResId(resId);
       String finish1 = reservationService.fin(finish);
       member_resDTO resDTO = reservationService.detail(resId);
       model.addAttribute("detail",resDTO);
       model.addAttribute("finish",finish1);
        return "redirect:/reservation/reservation?resId="+resDTO.getResId();
    }
    @GetMapping("/sort")
    public @ResponseBody List<member_resDTO> sort(@RequestParam String fin,@RequestParam Long id){
        member_resDTO DTO = new member_resDTO();
        DTO.setId(id);
        DTO.setFin(fin);
        System.out.println("fin = " + fin);
      List<member_resDTO>  finList = reservationService.sort(DTO);
        System.out.println("finList = " + finList);
      return finList;
    }

}
