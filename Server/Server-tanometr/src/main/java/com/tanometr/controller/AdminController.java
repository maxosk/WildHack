
package com.tanometr.controller;


import com.tanometr.domain.Measurement;
import com.tanometr.domain.Role;
import com.tanometr.domain.User;
import com.tanometr.repos.UserRepo;
import com.tanometr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private UserRepo userRepo;

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping
    public String userList(Model model) {
        List<User> workersList=userService.findStuff(userService.findAll());
        workersList.sort(Comparator.comparing(User::getId));
        model.addAttribute("workers",  workersList) ;

        List<User> patientsList = userService.findPatient(userService.findAll());
        patientsList.sort(Comparator.comparing(User::getId));
        model.addAttribute("patients",  patientsList) ;

        model.addAttribute("authorizedUser", SecurityContextHolder.getContext().getAuthentication().getPrincipal());


        return "admin";
    }

    @GetMapping(value="/api")
    public String registration() {
        return "admin";
    }
    @PostMapping
    public String addUser(User user, Map<String, Object> model,@RequestParam(value = "roles", required = false) String roles) {
        User userFromDb = userRepo.findByUsername(user.getUsername());

       /* if (userFromDb != null) {
            model.put("message", "User exists!");
            return "admin";
        }*/

        user.setActive(true);
        if(roles.equals("PATIENT")){
            user.setRoles(Collections.singleton(Role.PATIENT));
        }else
            user.setRoles(Collections.singleton(Role.USER));
        userRepo.save(user);

        return "redirect:/admin";
    }
}




