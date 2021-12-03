package com.tanometr.rest;


import lombok.Data;

import javax.validation.constraints.NotEmpty;
import java.util.List;

@Data
public class PhoneRequest {
    @NotEmpty
    private Integer id;
private String firstname;
private String middlename;
private String lastname;
private String password;
private String username;

    //private int bpu;

}
