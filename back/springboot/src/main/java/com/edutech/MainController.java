package com.edutech;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MainController {


    @GetMapping("/")
    public String home(Model model){
        model.addAttribute("title", "에듀테크");
        model.addAttribute("msg","스프링 부트 프로젝트입니다.");
        return "index";
    }

}
