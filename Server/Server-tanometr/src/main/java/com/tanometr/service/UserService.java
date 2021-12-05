package com.tanometr.service;

import com.tanometr.domain.Questionnaire;
import com.tanometr.domain.User;
import com.tanometr.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    public UserRepo userRepo;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return  userRepo.findByUsername( username);
    }

    public void save(User user) {
        userRepo.save(user);
    }
    public List<User> findAll() {
        return userRepo.findAll();
    }
    public User findById( List<User> userList,int id) {
        // List<User> newUserList=null ;
//int id = (int) (long) user.getId();
        //   List<User> newUserList = new ArrayList<User>();

        for (int i = 0; i < userList.size(); i++) {
            Integer kw=userList.get(i).getIndividual_id();
            if (kw.equals(id)) {
                return userList.get(i);
            }
        }
        return userList.get(0);
    }



}


