package com.footballdash.security;

import com.footballdash.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Service;

/**
 * This class tells spring security how to get a user from database.
 * This class is used in JwtFilter to validate tokens
 */

@Service
@RequiredArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService {

    private final UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByUsername(username)
                .map(user -> User.builder()
                                .username(user.getUsername())
                                .password(user.getPassword())
                                .roles("USER")
                                .build())
                .orElseThrow(() -> new UsernameNotFoundException("User not found: " + username));
    }
}
