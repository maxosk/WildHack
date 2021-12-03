package com.tanometr.controller;

import com.tanometr.domain.Role;
import com.tanometr.domain.User;
import com.tanometr.repos.UserRepo;
import com.tanometr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {
        User userFromDb = userRepo.findByUsername(user.getUsername());

        if (userFromDb != null) {
            model.put("message", "User exists!");
            return "registration";
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepo.save(user);


        return "redirect:/login";
    }

    /* @RequestMapping(value = "/admin", method = RequestMethod.GET)
     public ModelAndView adminHome() {
         ModelAndView modelAndView = new ModelAndView();
         modelAndView.setViewName("admin"); // resources/template/admin. html
         return modelAndView;
     }*/
    /*@RequestMapping("/admin")
    public class AdminController {
        @Autowired
        private UserService userService;

        @PreAuthorize("hasAuthority('ADMIN')")
        @GetMapping

        public ModelAndView userList(Model model) {
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.setViewName("admin"); // resources/template/admin. html
            model.addAttribute("users", userService.findAll());

            return modelAndView;
        }
    }*/

    /*@RequestMapping(value = "/doctor", method = RequestMethod.GET)
    public ModelAndView doctorHome() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("doctor"); // resources/template/admin. html
        return modelAndView;
    }*/
}

