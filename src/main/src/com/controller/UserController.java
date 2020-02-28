package com.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.entity.User;
import com.service.UserService;

@SessionAttributes("currentUser")
@Controller
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping("/main")
    public String  main(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model){
        model.addAttribute("pagemsg", userService.findByPage(currentPage));//回显分页数据
        return "main";
    }


    @RequestMapping("/index")
    public String index( ){
        return "main";
    }
}
