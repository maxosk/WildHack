package com.tanometr.domain;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

public enum Role implements GrantedAuthority {
   USER,ADMIN,PATIENT;

   @Override
   public String getAuthority() {
      return name();
   }


   public static boolean hasRole (String roleName)
   {
      return SecurityContextHolder.getContext().getAuthentication().getAuthorities().stream()
              .anyMatch(grantedAuthority -> grantedAuthority.getAuthority().equals(roleName));
   }


}