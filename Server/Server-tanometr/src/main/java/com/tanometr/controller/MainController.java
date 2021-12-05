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
import org.supercsv.io.CsvBeanWriter;
import org.supercsv.io.ICsvBeanWriter;
import org.supercsv.prefs.CsvPreference;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/main")
public class MainController {
@Autowired
    UserService userService;

    @Autowired
    QuestionnaireService questionnaireService;

    @GetMapping
    public String main(Model model) {

        List<User> list = userService.findAll();
        list.sort(Comparator.comparing(User::getLastname));
// добавление в лист элементов у кооторых ид совпадает с юзером,чтобы нужных добавить
        List<Questionnaire> questionnairesList = questionnaireService.findAll();
        for(User element:list){
            questionnairesList.add(questionnaireService.findByUserId(questionnaireService.findAll(),element.getIndividual_id()));
        }


model.addAttribute("questionnaires",questionnairesList);
        model.addAttribute("users", list);

       // model.addAttribute("questionnaires", userService.findAll());
       // Questionnaire





        return "listUsers";
    }

    @GetMapping("/download_file")
    public String download_file(HttpServletResponse response) throws IOException {
        List<User> list = userService.findAll();


        //  response.setContentType("text/csv");
        response.setContentType("text/csv");
//        response.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("windows-1251");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
        String currentDateTime = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=users_" + currentDateTime + ".csv";
        response.setHeader(headerKey, headerValue);

        // List<Measurement> listUsers = measurementService.findAll();

        ICsvBeanWriter csvWriter = new CsvBeanWriter(response.getWriter(), CsvPreference.STANDARD_PREFERENCE);
        String[] csvHeader = {"id", "firstname", "lastname", "middlename", "individual_id", "username"};
        String[] nameMapping = {"id", "firstname", "lastname", "middlename", "individual_id", "username"};

        csvWriter.writeHeader(csvHeader);

        for (User measurement : list) {
            csvWriter.write(measurement, nameMapping);
        }

        csvWriter.close();

        return "аавава";
    }


   /* @GetMapping
    public String userList(@RequestParam(defaultValue = "-1") Integer id, Model model) {


//        model.addAttribute("patients", userService.findPatient(userService.findAll()));
        model.addAttribute("authorizedUser", SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        model.addAttribute("yesterday", System.currentTimeMillis() - 24 * 60 * 60 * 1000);

        return "fdfdfdf";
        }
*/




}






