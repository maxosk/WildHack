package com.tanometr.rest;


import lombok.Data;

@Data
public class AuthRequest {
    private String login;
    private String password;
}