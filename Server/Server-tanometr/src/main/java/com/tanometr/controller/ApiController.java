package com.tanometr.controller;


import com.tanometr.domain.Questionnaire;
import com.tanometr.domain.User;
import com.tanometr.rest.PhoneRequest;
import com.tanometr.service.QuestionnaireService;
import com.tanometr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiController {
    @Autowired
    private UserService userService;

    @Autowired
 private QuestionnaireService questionnaireService;


    @PostMapping("/api")
    public String apiPhone(@RequestBody PhoneRequest request) {
        User user = new User();
//        Questionnaire questionnaire = new Questionnaire();
        user.setFirstname(request.getFirstname());
        user.setLastname(request.getLastname());
        user.setUsername(request.getUsername());
       // user.setId(request.get_id());
        user.setMiddlename(request.getMiddlename());
        user.setPassword(request.getPassword());
        user.setIndividual_id(request.get_id());
        userService.save(user);

        Questionnaire questionnaire = new Questionnaire();
        questionnaire.setCity(request.getCity());
        questionnaire.setAbout_your_hard_skills_check_boxes_first(request.getAbout_your_hard_skills_check_boxes_second());
        questionnaire.setUser_id(request.get_id());
        questionnaire.setAction_in_conflict(request.getAction_in_conflict());
        questionnaire.setTime(request.getDate_of_birth());
        questionnaire.setE_mail(request.getE_mail());
        questionnaire.setPhone_number(request.getPhone_number());
        questionnaire.setSocialnetwork(request.getSocialnetwork());
        questionnaire.setProfession(request.getProfession());
        questionnaire.setCamping_experience(request.getCamping_experience());
        questionnaire.setFathest_point_in_russia(request.getFathest_point_in_russia());
        questionnaire.setCriteria_of_volunteer_projects(request.getCriteria_of_volunteer_projects());
        questionnaire.setCriteria_of_choice_uni_or_job(request.getCriteria_of_choice_uni_or_job());
        questionnaire.setThe_most_important_in_job(request.getThe_most_important_in_job());
        questionnaire.setProject_pride(request.getProject_pride());
        questionnaire.setEco_habit(request.getEco_habit());
        questionnaire.setTeam_situation(request.getTeam_situation());
        questionnaire.setAction_in_conflict(request.getAction_in_conflict());
        questionnaire.setAbout_your_soft_skills_check_boxes_first(request.getAbout_your_soft_skills_check_boxes_first());
questionnaire.setCreative_material(request.getCreative_material());
questionnaire.setConsent_to_data_collection(request.getConsent_to_data_collection());
questionnaire.setConsent_to_publish_creative(request.getConsent_to_publish_creative());
questionnaire.setHow_find_school(request.getHow_find_school());
        questionnaireService.save(questionnaire);

        return "OK";
    }
}
