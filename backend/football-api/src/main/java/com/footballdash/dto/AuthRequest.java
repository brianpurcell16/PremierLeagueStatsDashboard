package com.footballdash.dto;
import lombok.Data;

/**
 * This dto is used because calling a user directly would mean the id could be provided in a register request opening the application up to malicious behaviour
 */
@Data
public class AuthRequest {
    private String username;
    private String password;
    private String email;
}
