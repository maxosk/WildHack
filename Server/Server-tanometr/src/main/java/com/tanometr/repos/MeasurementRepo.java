package com.tanometr.repos;


import com.tanometr.domain.Measurement;
import com.tanometr.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MeasurementRepo extends JpaRepository<Measurement, Long> {
    Measurement findById(String id);


}
