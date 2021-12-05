package com.tanometr.service;

import com.tanometr.domain.Questionnaire;
import com.tanometr.domain.User;
import com.tanometr.repos.QuestionnaireRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class QuestionnaireService {
    @Autowired
    public QuestionnaireRepo questionnaireRepo;

    public void saveQuestionnaire( Questionnaire questionnaire) {
        questionnaireRepo.save(questionnaire);
    }

    public List<Questionnaire> findAll() {return questionnaireRepo.findAll();}

    public void save(Questionnaire questionnaire) {
        questionnaireRepo.save(questionnaire);
    }

    public Questionnaire findByUserId( List<Questionnaire> measurementList,int id) {

        for (int i = 0; i < measurementList.size(); i++) {
            Integer kw=measurementList.get(i).getUser_id();
            if (kw.equals(id)) {
                return measurementList.get(i);
            }
        }
        return measurementList.get(0);
    }

}
