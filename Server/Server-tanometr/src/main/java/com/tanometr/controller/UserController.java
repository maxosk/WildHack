package com.tanometr.controller;



import com.tanometr.domain.Questionnaire;
import com.tanometr.domain.User;
import com.tanometr.service.QuestionnaireService;
import com.tanometr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;

//@SpringBootApplication
//@RestController

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;

    @Autowired
    QuestionnaireService questionnaireService;



    @GetMapping
    public String userList(@RequestParam(defaultValue = "-1") Integer id, Model model) {


//        model.addAttribute("patients", userService.findPatient(userService.findAll()));
     /*   model.addAttribute("authorizedUser", SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        model.addAttribute("yesterday", System.currentTimeMillis() - 24 * 60 * 60 * 1000);
*/
        model.addAttribute("user", (userService.findById(userService.findAll(),id)));
        model.addAttribute("questionnaire", questionnaireService.findByUserId(questionnaireService.findAll(),id));
        return "/index";
        }

    @GetMapping("/trash")
    public String userTrashList(@RequestParam(defaultValue = "-1") Integer id, Model model) {


//        model.addAttribute("patients", userService.findPatient(userService.findAll()));
     /*   model.addAttribute("authorizedUser", SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        model.addAttribute("yesterday", System.currentTimeMillis() - 24 * 60 * 60 * 1000);
*/
        model.addAttribute("user", (userService.findById(userService.findAll(),id)));
        model.addAttribute("questionnaire", questionnaireService.findByUserId(questionnaireService.findAll(),id));
        return "redirect:/user?id=" + id;
    }
   /* @GetMapping("tash")
    public String userTfrgashList(@RequestParam(defaultValue = "-1") Integer id, Model model) {


//        model.addAttribute("patients", userService.findPatient(userService.findAll()));
     *//*   model.addAttribute("authorizedUser", SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        model.addAttribute("yesterday", System.currentTimeMillis() - 24 * 60 * 60 * 1000);
*//*
        model.addAttribute("user", (userService.findById(userService.findAll(),id)));
        model.addAttribute("questionnaire", questionnaireService.findByUserId(questionnaireService.findAll(),id));
        return "/index";
    }*/




}






