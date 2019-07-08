package com.njnu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("index")
public class TestController {
    @RequestMapping("index")
    public String hello()
    {
        System.out.println("Index");
        return "index";
    }
}
