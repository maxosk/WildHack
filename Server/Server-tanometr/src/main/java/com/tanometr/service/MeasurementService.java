package com.tanometr.service;

import com.tanometr.domain.Measurement;
import com.tanometr.domain.User;
import com.tanometr.repos.MeasurementRepo;
import com.tanometr.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class MeasurementService  {
    @Autowired
    public MeasurementRepo measurementRepo;
    @Autowired
    public UserRepo userRepo;
    @Autowired
    private UserService userService;
    
    public List<Measurement> findListById(List<Measurement> measurementList, int id) {
        List<Measurement> newMeasurementList =new ArrayList<Measurement> ();
        for (int i = 0; i < measurementList.size(); i++) {
         //   Long id_measurement=measurementList.get(i).getId();
            if (measurementList.get(i).getUser().getId().equals((long)id)) {
                newMeasurementList.add(measurementList.get(i));
            }
        }
        //if (newMeasurementList.isEmpty()) newMeasurementList.add(measurementList.get(0));
        return newMeasurementList;
    }
    public Measurement saveMeasurementByUserId(int id, Measurement measurement) {
      //  measurement.setId(26L);
        User user = new User();
        measurement.setUser(userService.findById(userService.findAll(), id));
        measurementRepo.save(measurement);
        return measurementRepo.save(measurement);
    }
    public void saveMeasurement( Measurement measurement) {
        measurementRepo.save(measurement);
    }

    public List<Measurement> findAll() {return measurementRepo.findAll();
    }

    public Measurement findById( List<Measurement> measurementList,int id) {

        for (int i = 0; i < measurementList.size(); i++) {
            Long kw=measurementList.get(i).getId();
            if (measurementList.get(i).getId().equals((long)id)) {
                return measurementList.get(i);
            }
        }
        return measurementList.get(0);
    }

    public Long findByUserIdAndLocalId(List<Measurement> measurementList, int measurementId, int  userId) {

        List<Measurement> tempMeasurementList = new ArrayList<Measurement>();


        for (int i = 0; i < measurementList.size(); i++) {
            if (measurementList.get(i).getIndividual_measurement_id().equals((long)measurementId)) {
                tempMeasurementList.add(measurementList.get(i)) ;
            }
        }



if (tempMeasurementList.size()==0){
    return -2l;
}
else {
        for (int i = 0; i < tempMeasurementList.size(); i++) {
            Long kw=tempMeasurementList.get(i).getId();
            if (tempMeasurementList.get(i).getUser().getId().equals((long)userId)) {
                return tempMeasurementList.get(i).getId();
            }
        }
        return tempMeasurementList.get(0).getId();
    }}
}