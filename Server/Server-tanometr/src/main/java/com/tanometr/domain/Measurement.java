package com.tanometr.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Table(name = "measurement")
public class Measurement implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;


    public Integer getBlood_pressure_upper() {
        return blood_pressure_upper;
    }

    public void setBlood_pressure_upper(Integer blood_pressure_upper) {
        this.blood_pressure_upper = blood_pressure_upper;
    }

    public Integer getBlood_pressure_lower() {
        return blood_pressure_lower;
    }

    public void setBlood_pressure_lower(Integer blood_pressure_lower) {
        this.blood_pressure_lower = blood_pressure_lower;
    }


    private Integer blood_pressure_upper = 0;
    private boolean isCorrectByPatient = true;
    private boolean isCorrectByDoctor = true;
    private Integer blood_pressure_lower = 0;
    private Integer pulseRate = 0;
    private String comment = "";

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    private Date time;

    {
        try {
            time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS")
                    .parse("2012-07-10 14:58:00.000000");
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    @Temporal(TemporalType.TIMESTAMP)
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "individual_measurement_id")
    private Long individual_measurement_id;

    public Long getIndividual_measurement_id() {
        return individual_measurement_id;
    }

    public void setIndividual_measurement_id(Long individual_measurement_id) {
        this.individual_measurement_id = individual_measurement_id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public User getUser() {
        return user;
    }
    public Long getUser_id() {
        return user.getId();
    }

    public void setUser(User user) {
        this.user = user;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public Integer getPulseRate() {
        return pulseRate;
    }

    public void setPulseRate(Integer pulseRate) {
        this.pulseRate = pulseRate;
    }


    public boolean getIsCorrectByPatient() {
        return isCorrectByPatient;
    }

    public void setCorrectByPatient(boolean correctByPatient) {
        isCorrectByPatient = correctByPatient;
    }

    public boolean getIsCorrectByDoctor() {
        return isCorrectByDoctor;
    }

    public void setCorrectByDoctor(boolean correctByDoctor) {
        isCorrectByDoctor = correctByDoctor;
    }


    public Measurement() {

    }





}