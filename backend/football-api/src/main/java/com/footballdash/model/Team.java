package com.footballdash.model;

import jakarta.persistence.*;
import lombok.*;

/**
 * This file represents a premier league club
 * externalId is used to map to the clubs ID on football-data.org which is the api being used
 * Storing it stops it from being duplicated when re-syncing with the api
 */

@Entity
@Table(name = "teams")
@Data
@AllArgsConstructor
@NoArgsConstructor

public class Team {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private Long externalId; // e.g. 57 = Manchester City on football-data.org

    @Column(nullable = false)
    private String name;
    private String shortName;
    private String tla;
    private String crest;
    private String venue;
    private String founded;
    private String website;
    private String clubColours;
}
