package com.footballdash.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "users")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String username;

    /** Stored as a BCrypt hash never plain text */
    @Column(nullable = false)
    private String password;

    @Column(unique = true)
    private String email;
}
