package com.footballdash.dto;
import lombok.*;

/**
 * This dto is used because the other option would be to return the user in the response meaning the encrypted password would be dispalyed
 */
@Data
@AllArgsConstructor
public class AuthResponse {
    private String token;
}
