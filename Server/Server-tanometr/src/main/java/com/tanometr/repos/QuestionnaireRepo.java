package com.tanometr.repos;

import com.tanometr.domain.Questionnaire;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionnaireRepo extends JpaRepository<Questionnaire, Long> {
    Questionnaire findById(String id);}

