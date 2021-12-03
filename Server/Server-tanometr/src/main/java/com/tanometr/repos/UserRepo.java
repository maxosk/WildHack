package com.tanometr.repos;

import com.tanometr.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;


    public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
    //User findById(Integer id);

}

