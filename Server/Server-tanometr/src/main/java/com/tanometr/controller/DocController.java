
package com.tanometr.controller;


import com.tanometr.domain.Measurement;
import com.tanometr.domain.User;
import com.tanometr.repos.UserRepo;
import com.tanometr.service.MeasurementService;
import com.tanometr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.supercsv.io.CsvBeanWriter;
import org.supercsv.io.ICsvBeanWriter;
import org.supercsv.prefs.CsvPreference;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Logger;


@Controller
@RequestMapping("/doctor")
public class DocController {

    @Autowired
    private UserService userService;
    @Autowired
    private MeasurementService measurementService;
    @Autowired
    private UserRepo userRepo;
    private static Logger log = Logger.getLogger(DocController.class.getName());

    List<String> relevanceOfMeasurements = new ArrayList<>();
    List<String> healthyOfMeasurements = new ArrayList<>();

    @PreAuthorize("hasAuthority('USER')")
    @GetMapping
    public String userList(@RequestParam(defaultValue = "") Integer id, Model model) {

        model.addAttribute("patients", userService.findPatient(userService.findAll()));
        model.addAttribute("authorizedUser", SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        model.addAttribute("yesterday", System.currentTimeMillis() - 24 * 60 * 60 * 1000);
        //log.info(userService.findById(id).get;

/*
        List<Measurement> list = measurementService.findListById(measurementService.findAll(), id);
        list.sort(Comparator.comparing(Measurement::getTime).thenComparing(Measurement::getId).reversed());
*/
        //Проверка на долгое время без измерений
        for (User patientss : userService.findPatient(userService.findAll())
        ) {
            List<Measurement> list = measurementService.findListById(measurementService.findAll(), Math.toIntExact(patientss.getId()));
            list.sort(Comparator.comparing(Measurement::getTime).thenComparing(Measurement::getId).reversed());
            if (list.size() == 0) {
                relevanceOfMeasurements.add("null");
            } else
                relevanceOfMeasurements.add(String.valueOf(list.get(0).getTime().before((new Date(System.currentTimeMillis() - 24 * 60 * 60 * 1000)))));
        }
        //Проверка на опасные для здоровья измерения
        for (User patientss : userService.findPatient(userService.findAll())
        ) {
            List<Measurement> list = measurementService.findListById(measurementService.findAll(), Math.toIntExact(patientss.getId()));
            list.sort(Comparator.comparing(Measurement::getTime).thenComparing(Measurement::getId).reversed());
            if (list.size() == 0) {
                healthyOfMeasurements.add("null");
            } else if (list.get(0).getBlood_pressure_lower() > 90 || list.get(0).getBlood_pressure_upper() > 140) {
                healthyOfMeasurements.add("true");
            } else {
                healthyOfMeasurements.add("false");
            }
        }
       /* for (int i =0;i<userService. findPatient(userService.findAll()).size();i++  ){
            relevanceOfMeasurements.add(String.valueOf(list.get(0).getTime().before((new Date(System.currentTimeMillis() - 24 * 60 * 60 * 1000)))));
        }*/

        if (id == null) {
            model.addAttribute("selected", null);
            model.addAttribute("relevanceOfMeasurements", relevanceOfMeasurements);
            model.addAttribute("healthyOfMeasurements", healthyOfMeasurements);


        } else {
            model.addAttribute("selected", userService.findById(userService.findAll(), id));
            List<Measurement> list = measurementService.findListById(measurementService.findAll(), id);
            list.sort(Comparator.comparing(Measurement::getTime).thenComparing(Measurement::getId).reversed());
            //      log.info(String.valueOf(list.get(0).getTime().before((new Date(System.currentTimeMillis() - 24 * 60 * 60 * 1000)))));
            model.addAttribute("measurements", list);
            model.addAttribute("relevanceOfMeasurements", relevanceOfMeasurements);
            model.addAttribute("healthyOfMeasurements", healthyOfMeasurements);


/*
            if (list.size() == 0) {
                model.addAttribute("relevanceOfMeasurements", null);
            } else {
                model.addAttribute("relevanceOfMeasurements", String.valueOf(list.get(0).getTime().before((new Date(System.currentTimeMillis() - 24 * 60 * 60 * 1000)))));
            }
*/
        }

        return "doctor";
    }

    @GetMapping("/download_file")
    public void exportToCSV(HttpServletResponse response, @RequestParam(defaultValue = "-1") Integer id) throws IOException {
        List<Measurement> list = measurementService.findListById(measurementService.findAll(), id);
        list.sort(Comparator.comparing(Measurement::getTime).thenComparing(Measurement::getId).reversed());


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
        String[] csvHeader = {"User ID", "blood_pressure_upper", "blood_pressure_lower", "pulse_rate", "time", "is_correct_by_doctor", "is_correct_by_patient", "comment"};
        String[] nameMapping = {"user_id", "blood_pressure_upper", "blood_pressure_lower", "pulseRate", "time", "isCorrectByDoctor", "isCorrectByPatient", "comment"};

        csvWriter.writeHeader(csvHeader);

        for (Measurement measurement : list) {
            csvWriter.write(measurement, nameMapping);
        }

        csvWriter.close();

    }

    @GetMapping("/api")
    public @ResponseBody
    List<User> getAll() {
        return userService.findAll();
    }

    // @PreAuthorize("hasAuthority('USER')")
    @GetMapping(value = "/editCustomer")
    public String editCustomer(@RequestParam(value = "checkboxName", required = false) String checkboxValue, @RequestParam(defaultValue = "-1") Integer id, @RequestParam(defaultValue = "-1") Integer measurement_id, Model model) {
        model.addAttribute("patients", userService.findPatient(userService.findAll()));
        model.addAttribute("authorizedUser", SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        for (User patientss : userService.findPatient(userService.findAll())
        ) {
            List<Measurement> list = measurementService.findListById(measurementService.findAll(), Math.toIntExact(patientss.getId()));
            list.sort(Comparator.comparing(Measurement::getTime).thenComparing(Measurement::getId).reversed());
            if (list.size() == 0) {
                relevanceOfMeasurements.add("null");
            } else
                relevanceOfMeasurements.add(String.valueOf(list.get(0).getTime().before((new Date(System.currentTimeMillis() - 24 * 60 * 60 * 1000)))));
        }
        for (User patientss : userService.findPatient(userService.findAll())
        ) {
            List<Measurement> list = measurementService.findListById(measurementService.findAll(), Math.toIntExact(patientss.getId()));
            list.sort(Comparator.comparing(Measurement::getTime).thenComparing(Measurement::getId).reversed());
            if (list.size() == 0) {
                healthyOfMeasurements.add("null");
            } else if (list.get(0).getBlood_pressure_lower() > 90 || list.get(0).getBlood_pressure_upper() > 140) {
                healthyOfMeasurements.add("true");
            } else {
                healthyOfMeasurements.add("false");
            }
        }
        if (id == null) {
            model.addAttribute("selected", null);
            model.addAttribute("relevanceOfMeasurements", relevanceOfMeasurements);
            model.addAttribute("healthyOfMeasurements", healthyOfMeasurements);


        } else {
            model.addAttribute("selected", userService.findById(userService.findAll(), id));
            List<Measurement> list = measurementService.findListById(measurementService.findAll(), id);
            list.sort(Comparator.comparing(Measurement::getTime).thenComparing(Measurement::getId).reversed());
            model.addAttribute("measurements", list);
            if (list.size() == 0) {
                model.addAttribute("relevanceOfMeasurements", relevanceOfMeasurements);
                model.addAttribute("healthyOfMeasurements", healthyOfMeasurements);

            } else {
                model.addAttribute("relevanceOfMeasurements", relevanceOfMeasurements);
                model.addAttribute("healthyOfMeasurements", healthyOfMeasurements);

            }
            System.out.println(String.valueOf(list.get(0).getTime().before((new Date(System.currentTimeMillis() - 24 * 60 * 60 * 1000)))));

            //   System.out.println(measurementService.findListById(measurementService.findAll(),id));
        }
        // Measurement measurement = measurementService.findById(measurementService.findListById(measurementService.findAll(),measurement_id))
        if (checkboxValue.equals("checked,on")) {
            Measurement measurement = measurementService.findById(measurementService.findListById(measurementService.findAll(), id), measurement_id);
            //        measurement.setId(Long.valueOf(measurement_id));
            measurement.setCorrectByDoctor(false);

/*
            Calendar c = Calendar.getInstance();
            c.setTime(measurement.getTime());
            int dayOfWeek = c.get(Calendar.DAY_OF_MONTH);
*/
            System.out.println(measurement.getTime().getDay());
            measurementService.saveMeasurement(measurement);
        } else {
/*
            measurement.setCorrectByDoctor(true);
            measurementService.saveMeasurement(measurement_id,measurement);
*/
            Measurement measurement = measurementService.findById(measurementService.findListById(measurementService.findAll(), id), measurement_id);
            //   measurement.setId(Long.valueOf(measurement_id));
            measurement.setCorrectByDoctor(true);
            measurementService.saveMeasurement(measurement);


        }
        return "redirect:/doctor?id=" + id;
    }


   /* @PreAuthorize("hasAuthority('USER')")
    @GetMapping("{userid}")
    public String userGet(@PathVariable ("userid") int userid, Model model) {
        model.addAttribute("patients", userService.findPatient(userService.findAll()));
        model.addAttribute("selected", userService.findById(userService.findAll(),userid));
//        return "/doctor";
        System.out.println(userService.findById(userService.findAll(),userid).getUsername());
        return "doctor";

    }*/


}

