package com.its.Auto.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {
    @GetMapping("/")
    public String index(){return "index";}

    @GetMapping("/logout")
    public String logout(HttpSession session){
    session.invalidate();
    return "index";
    }
}
