package com.tanometr.service;

import com.tanometr.domain.Role;
import com.tanometr.domain.User;
import com.tanometr.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    public UserRepo userRepo;

    @Autowired
    private MailSender mailSender;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }

    public boolean addUser(User user) {
        User userFromDb = userRepo.findByUsername(user.getUsername());

        if (userFromDb != null) {
            return false;
        }

        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRoles(Collections.singleton(Role.USER));
        // user.setActivationCode(UUID.randomUUID().toString());

        userRepo.save(user);

        // sendMessage(user);

        return true;
    }

   /* private void sendMessage(User user) {
        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format(
                    "Hello, %s! \n" +
                            "Welcome to Sweater. Please, visit next link: http://localhost:8080/activate/%s",
                    user.getUsername(),
                    user.getActivationCode()
            );

            mailSender.send(user.getEmail(), "Activation code", message);
        }
    }*/

   /* public boolean activateUser(String code) {
        User user = userRepo.findByActivationCode(code);

        if (user == null) {
            return false;
        }

        user.setActivationCode(null);

        userRepo.save(user);

        return true;
    }*/


    public List<User> findAll() {
        return userRepo.findAll();
    }

    public List<User> findStuff(List<User> userList) {
        // List<User> newUserList=null ;
        List<User> newUserList = new ArrayList<User>();

        for (int i = 0; i < userList.size(); i++) {
            if (!String.valueOf(userList.get(i).getRoles()).equals("[PATIENT]")) {
                newUserList.add(userList.get(i));
            }
        }
        return newUserList;
    }

    public List<User> findPatient(List<User> userList) {
        // List<User> newUserList=null ;
        List<User> newUserList = new ArrayList<User>();

        for (int i = 0; i < userList.size(); i++) {

            if (String.valueOf(userList.get(i).getRoles()).equals("[PATIENT]")) {
                newUserList.add(userList.get(i));
            }
        }
        return newUserList;
    }

    public User findById( List<User> userList,int id) {
        // List<User> newUserList=null ;
//int id = (int) (long) user.getId();
     //   List<User> newUserList = new ArrayList<User>();

        for (int i = 0; i < userList.size(); i++) {
            Long kw=userList.get(i).getId();
            if (userList.get(i).getId().equals((long)id)) {
                return userList.get(i);
            }
        }
        return userList.get(0);
    }


    public void saveUser(User user, String username, Map<String, String> form) {
        user.setUsername(username);

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepo.save(user);
    }

    public User findByLoginAndPassword(String login, String password) {
        User userEntity = (User) loadUserByUsername(login);
        if (userEntity != null) {
            if (passwordEncoder.matches(password, userEntity.getPassword())) {
                return userEntity;
            }
        }
        return null;
    }

    public void   saveUser(User user) {
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.PATIENT));
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepo.save(user);
       // return userRepo.save(user);

    }

    /*public void updateProfile(User user, String password, String email) {
        String userEmail = user.getEmail();

        boolean isEmailChanged = (email != null && !email.equals(userEmail)) ||
                (userEmail != null && !userEmail.equals(email));

        if (isEmailChanged) {
            user.setEmail(email);

            if (!StringUtils.isEmpty(email)) {
                user.setActivationCode(UUID.randomUUID().toString());
            }
        }

        if (!StringUtils.isEmpty(password)) {
            user.setPassword(password);
        }

        userRepo.save(user);

        if (isEmailChanged) {
            sendMessage(user);
        }
    }*/
}