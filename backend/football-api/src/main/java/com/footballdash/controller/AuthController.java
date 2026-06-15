package com.footballdash.controller;

import com.footballdash.dto.AuthRequest;
import com.footballdash.dto.AuthResponse;
import com.footballdash.model.User;
import com.footballdash.repository.UserRepository;
import com.footballdash.security.JwtUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.http.*;
import org.springframework.security.authentication.*;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.*;



@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;

    /** POST /api/auth/register */
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody AuthRequest authRequest) {
        if(userRepository.existsByUsername(authRequest.getUsername())) {
            return ResponseEntity.badRequest().body("Username is already in use");
        }
        User user = User.builder()
                .username(authRequest.getUsername())
                .email(authRequest.getEmail())
                .password(passwordEncoder.encode(authRequest.getPassword()))
                .build();
        userRepository.save(user);
        return ResponseEntity.status(HttpStatus.CREATED).body("User registered successfully");
    }

    /** POST /api/auth/login - returns a token on success */
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthRequest authRequest) {
        try{
            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(authRequest.getUsername(), authRequest.getPassword()));
        } catch(BadCredentialsException e){
            return ResponseEntity
                    .status(HttpStatus.UNAUTHORIZED)
                    .body("Invalid username or password");
        }
        String token = jwtUtil.generateToken(authRequest.getUsername());
        return ResponseEntity.ok(new AuthResponse(token));
    }
}
