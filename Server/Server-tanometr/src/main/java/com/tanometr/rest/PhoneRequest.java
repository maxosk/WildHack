package com.tanometr.rest;


import lombok.Data;

import javax.validation.constraints.NotEmpty;
import java.util.List;

@Data
public class PhoneRequest {

    private int _id;
private String firstname;
private String middlename;
private String lastname;
private String password;
private String username;
private String date_of_birth;
private String e_mail ;
private String phone_number ;
private String socialnetwork ;
private String city ;
private String profession ;
private String camping_experience ;
private String fathest_point_in_russia ;
private String criteria_of_volunteer_projects ;
private String criteria_of_choice_uni_or_job ;
private String the_most_important_in_job ;
private String project_pride ;
private String eco_habit ;
private String team_situation ;
private String action_in_conflict ;
private String about_your_soft_skills_check_boxes_first ;
private String about_your_hard_skills_check_boxes_second ;
private String creative_material ;
private Boolean consent_to_publish_creative ;
private String how_find_school ;
private Boolean consent_to_data_collection ;

    //private int bpu;

}
