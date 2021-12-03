package com.tanometr.controller;
import com.tanometr.domain.User;
import com.tanometr.repos.UserRepo;
import com.tanometr.service.MeasurementService;
import com.tanometr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;


@RestController
public class PatientController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserRepo userRepo;

    //@PreAuthorize("hasAuthority('PATIENT')")
    @GetMapping("/patient")
    public String registration() {
        return "patient";
    }
}
