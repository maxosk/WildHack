package com.tanometr.controller;


import com.tanometr.domain.Questionnaire;
import com.tanometr.domain.User;
import com.tanometr.rest.PhoneRequest;
import com.tanometr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiController {
    @Autowired
    private UserService userService;


    @PostMapping("/api")
    public String apiPhone(@RequestBody PhoneRequest request) {
        User user = new User();
//        Questionnaire questionnaire = new Questionnaire();
        user.setFirstname(request.getFirstname());
        user.setLastname(request.getLastname());
        user.setUsername(request.getUsername());
        user.setId(request.getId());
        user.setMiddlename(request.getMiddlename());
        user.setPassword(request.getPassword());
        userService.save(user);
        return "OK";
    }
}
