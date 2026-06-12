package com.footballdash.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDate;

@Entity
@Table(name = "players")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Player {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private String externalId;

    @Column(nullable = false)
    private String name;
    private String position;
    private String nationality;
    private LocalDate dateOfBirth;
    private String shirtNumber;
    private long teamId; // foreign key to link to teams table
}
