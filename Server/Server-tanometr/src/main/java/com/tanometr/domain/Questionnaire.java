package com.tanometr.domain;


import javax.persistence.*;
import javax.persistence.criteria.CriteriaBuilder;
import java.io.Serial;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;

@Entity
@Table(name = "questionnaire")
public class Questionnaire implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private Integer user_id;
    private String time;
   /* {
        try {
            time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS")
                    .parse("2012-07-10 14:58:00.000000");
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }*/
    private String e_mail;
    private String phone_number;
    private String socialnetwork;
    private String city;
    private String profession;
    private String camping_experience;
    private String fathest_point_in_russia;
    private String criteria_of_volunteer_projects;
    private String criteria_of_choice_uni_or_job;
    private String the_most_important_in_job;
    private String project_pride;
    private String eco_habit;
    private String team_situation;
    private String action_in_conflict;

    private String about_your_soft_skills_check_boxes_first;
    @Column(columnDefinition="varchar(1000)")
    private String about_your_hard_skills_check_boxes_first;

    private String creative_material; //WTF СУКА БЛАТЬ
    private Boolean consent_to_publish_creative;
    private String how_find_school;
    private Boolean consent_to_data_collection;

    /*@OneToOne(optional = false, mappedBy = "questionnaire")
    public User user.ftl;

    public User getUser(){
        return user.ftl;
    }
    public void setUser(User user.ftl){
        this.user.ftl = user.ftl;
    }*/


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getE_mail() {
        return e_mail;
    }

    public void setE_mail(String e_mail) {
        this.e_mail = e_mail;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getSocialnetwork() {
        return socialnetwork;
    }

    public void setSocialnetwork(String socialnetwork) {
        this.socialnetwork = socialnetwork;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getCamping_experience() {
        return camping_experience;
    }

    public void setCamping_experience(String camping_experience) {
        this.camping_experience = camping_experience;
    }

    public String getFathest_point_in_russia() {
        return fathest_point_in_russia;
    }

    public void setFathest_point_in_russia(String fathest_point_in_russia) {
        this.fathest_point_in_russia = fathest_point_in_russia;
    }

    public String getCriteria_of_volunteer_projects() {
        return criteria_of_volunteer_projects;
    }

    public void setCriteria_of_volunteer_projects(String criteria_of_volunteer_projects) {
        this.criteria_of_volunteer_projects = criteria_of_volunteer_projects;
    }

    public String getCriteria_of_choice_uni_or_job() {
        return criteria_of_choice_uni_or_job;
    }

    public void setCriteria_of_choice_uni_or_job(String criteria_of_choice_uni_or_job) {
        this.criteria_of_choice_uni_or_job = criteria_of_choice_uni_or_job;
    }

    public String getThe_most_important_in_job() {
        return the_most_important_in_job;
    }

    public void setThe_most_important_in_job(String the_most_important_in_job) {
        this.the_most_important_in_job = the_most_important_in_job;
    }

    public String getProject_pride() {
        return project_pride;
    }

    public void setProject_pride(String project_pride) {
        this.project_pride = project_pride;
    }

    public String getEco_habit() {
        return eco_habit;
    }

    public void setEco_habit(String eco_habit) {
        this.eco_habit = eco_habit;
    }

    public String getTeam_situation() {
        return team_situation;
    }

    public void setTeam_situation(String team_situation) {
        this.team_situation = team_situation;
    }

    public String getAction_in_conflict() {
        return action_in_conflict;
    }

    public void setAction_in_conflict(String action_in_conflict) {
        this.action_in_conflict = action_in_conflict;
    }

    public String getAbout_your_soft_skills_check_boxes_first() {
        return about_your_soft_skills_check_boxes_first;
    }

    public void setAbout_your_soft_skills_check_boxes_first(String about_your_soft_skills_check_boxes_first) {
        this.about_your_soft_skills_check_boxes_first = about_your_soft_skills_check_boxes_first;
    }

    public String getAbout_your_hard_skills_check_boxes_first() {
        return about_your_hard_skills_check_boxes_first;
    }

    public void setAbout_your_hard_skills_check_boxes_first(String about_your_hard_skills_check_boxes_first) {
        this.about_your_hard_skills_check_boxes_first = about_your_hard_skills_check_boxes_first;
    }

    public String getCreative_material() {
        return creative_material;
    }

    public void setCreative_material(String creative_material) {
        this.creative_material = creative_material;
    }

    public Boolean getConsent_to_publish_creative() {
        return consent_to_publish_creative;
    }

    public void setConsent_to_publish_creative(Boolean consent_to_publish_creative) {
        this.consent_to_publish_creative = consent_to_publish_creative;
    }

    public String getHow_find_school() {
        return how_find_school;
    }

    public void setHow_find_school(String how_find_school) {
        this.how_find_school = how_find_school;
    }

    public Boolean getConsent_to_data_collection() {
        return consent_to_data_collection;
    }

    public void setConsent_to_data_collection(Boolean consent_to_data_collection) {
        this.consent_to_data_collection = consent_to_data_collection;
    }
}
