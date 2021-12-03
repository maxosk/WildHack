package com.tanometr.controller;


import com.tanometr.config.jwt.JwtProvider;
import com.tanometr.domain.Measurement;
import com.tanometr.domain.User;
import com.tanometr.rest.*;
import com.tanometr.service.MeasurementService;
import com.tanometr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

@RestController
public class AuthController {

    @Autowired
    private UserService userService;
    @Autowired
    private MeasurementService measurementService;
    @Autowired
    private JwtProvider jwtProvider;
    @PostMapping("/register")
    public String registerUser(@RequestBody @Valid RegistrationRequest registrationRequest) {
        User u = new User();
        u.setPassword(registrationRequest.getPassword());
        u.setUsername(registrationRequest.getLogin());
        userService.saveUser(u);
        return "OK";
    }

    @PostMapping("/auth")
    public AuthResponse auth(@RequestBody AuthRequest request) {
        User userEntity = userService.findByLoginAndPassword(request.getLogin(), request.getPassword());
        String token = jwtProvider.generateToken(userEntity.getUsername());
        Long id = userEntity.getId();
        return new AuthResponse(token,id);
    }

}