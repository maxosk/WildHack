package com.tanometr.service;

import com.tanometr.domain.Questionnaire;
import com.tanometr.repos.QuestionnaireRepo;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class QuestionnaireService {
    @Autowired
    public QuestionnaireRepo questionnaireRepo;

    public void saveQuestionnaire( Questionnaire questionnaire) {
        questionnaireRepo.save(questionnaire);
    }

    public List<Questionnaire> findAll() {return questionnaireRepo.findAll();}



}
