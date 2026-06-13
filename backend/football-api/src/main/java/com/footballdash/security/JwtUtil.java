package com.footballdash.security;

import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import java.security.Key;
import java.util.Date;




//This file handles JWT token generation, parsing and validation.
//The secret and expiry for the token are taken from application.properties

// @Component lets Spring create and manage an instance of this class
// automatically, so other classes can have it injected without
// calling "new JwtUtil()" themselves.
@Component
public class JwtUtil {

    @Value("${jwt.secret}")
    private String secret;

    @Value("${jwt.expiration}")
    private Long expiration;

    private Key getSigningKey() {
        return Keys.hmacShaKeyFor(secret.getBytes());
    }

    /** Creates a signed token for the username passed in */
    public String generateToken(String username) {
        return Jwts.builder()
                .setSubject(username)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + expiration))
                .signWith(getSigningKey())
                .compact();
    }

    /** Retrieve the username from a valid token */
    public String extractUsername(String token) {
        return Jwts.parserBuilder()
                .setSigningKey(getSigningKey())
                .build()
                .parseClaimsJws(token)
                .getBody()
                .getSubject();
    }

    /** True is returned if the token signature is valid and the token has not expired */
    public boolean validateToken(String token, UserDetails userDetails ) {
        try{
            String username = extractUsername(token);
            Date expiry = Jwts.parserBuilder()
                    .setSigningKey(getSigningKey()).build()
                    .parseClaimsJws(token).getBody().getExpiration();
            return username.equals(userDetails.getUsername()) && expiry.after(new Date());
        } catch (JwtException e){
            //Used to catch any token that should not be allowed in
            return false;
        }
    }

}
