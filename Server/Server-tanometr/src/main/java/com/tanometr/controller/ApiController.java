package com.tanometr.controller;

import com.tanometr.config.jwt.JwtProvider;
import com.tanometr.domain.Measurement;
import com.tanometr.rest.MeasurementInfoRequest;
import com.tanometr.rest.PhoneRequest;
import com.tanometr.service.MeasurementService;
import com.tanometr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ApiController {
    @Autowired
    private UserService userService;
    @Autowired
    private MeasurementService measurementService;
    @Autowired
    private JwtProvider jwtProvider;


    @PostMapping("/api/patient")
    public String apiPhone(@RequestBody PhoneRequest request) {

        List<MeasurementInfoRequest> list = request.getMeasurements();
        //   for (i=)
        for (MeasurementInfoRequest element : list) {
            Measurement measurement = new Measurement();
            //    System.out.println(          (Long.valueOf(measurementService.findByUserIdAndLocalId(measurementService.findAll(), element.getId(),request.getId()))));
            Long i = (Long.valueOf(measurementService.findByUserIdAndLocalId(measurementService.findAll(), element.getId(), request.getId())));
            if (i != -2) {
                measurement.setId(i);
            }
            measurement.setIndividual_measurement_id(Long.valueOf(element.getId()));
            measurement.setBlood_pressure_upper(element.getSystolic());
            measurement.setBlood_pressure_lower(element.getDiastolic());
            measurement.setPulseRate(element.getPulse());
            if (element.getCorrectFlag() == 1) {
                measurement.setCorrectByPatient(true);
            } else {
                measurement.setCorrectByPatient(false);
            }
            measurement.setTime(element.getTime());
            measurement.setComment(element.getComment());
            measurementService.saveMeasurementByUserId(request.getId(), measurement);
        }
        //measurement.setBlood_pressure_upper(request.getBpu());
        // measurement.setUser_id(Long.valueOf(request.getId()));

        return "OK";
    }
}
