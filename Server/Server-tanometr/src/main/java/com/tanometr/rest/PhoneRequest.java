package com.tanometr.rest;


import lombok.Data;

import javax.validation.constraints.NotEmpty;
import java.util.List;

@Data
public class PhoneRequest {
    @NotEmpty
    private int id;
    List<MeasurementInfoRequest> measurements;
    //private int bpu;

}
