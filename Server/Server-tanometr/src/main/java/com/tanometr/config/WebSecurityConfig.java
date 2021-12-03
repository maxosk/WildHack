package com.tanometr.config;

import com.tanometr.config.jwt.JwtFilter;
import com.tanometr.handler.CustomLoginSuccessHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import com.tanometr.service.UserService;

import javax.sql.DataSource;

import com.tanometr.service.UserService;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserService userService;
    @Autowired
    private CustomLoginSuccessHandler sucessHandler;
    @Lazy
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private JwtFilter jwtFilter;
    @Lazy
    @Bean
    public PasswordEncoder getPasswordEncoder(){
        return new BCryptPasswordEncoder(8);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                //.httpBasic().disable()
/*
                .httpBasic().disable()
                .csrf().disable()
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
*/
                .authorizeRequests()
                .antMatchers("/", /*"/registration",*/ "/static/**", "/activate/*","/auth","/register").permitAll()
                .antMatchers("/register", "/auth/**").permitAll()
                .antMatchers("/register/**", "/auth/**").permitAll()
                .antMatchers("/doctor/**").hasAnyAuthority("USER")
                .antMatchers("/admin/**").hasAnyAuthority("ADMIN")
               .antMatchers("/api/**").hasAnyAuthority("PATIENT")
               .antMatchers("/patient/**").hasAnyAuthority("PATIENT")
               .antMatchers("/user/**").hasAnyAuthority("ADMIN")


                .anyRequest().authenticated()
                //.and().csrf().ignoringAntMatchers("/user/**")
                .and().csrf().ignoringAntMatchers("/api/**")
                .and().csrf().ignoringAntMatchers("/auth/**")
                .and().csrf().ignoringAntMatchers("/register/**")
                //.httpBasic().ig
                .and()
                .formLogin()
                .loginPage("/login")
                .failureUrl("/login?error=true")
                .successHandler(sucessHandler)
                .permitAll()
                .and()
                .logout()
                .permitAll()
                .and()
                .addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);;

    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService)
                .passwordEncoder(passwordEncoder);
    }
}