package com.tanometr.rest;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import java.util.Date;
import java.util.List;

@Data
public class MeasurementInfoRequest {

    private int id;
    private int systolic;
    private int diastolic;
    private int pulse;
    private int correctFlag;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date time;
    private String comment;

}