package com.footballdash.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "matches")
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Match {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(unique = true)
    private Long externalId;
    
    private String homeTeamName;
    private String awayTeamName;
    private Long homeTeamExternalId;
    private Long awayTeamExternalId;
    
    private Integer homeScore;
    private Integer awayScore;
    
    private String status; // used to tell if the matched has happened, is scheduled to happen or is live with some other options that would be rare
    private LocalDateTime utcDate;
    private Integer matchday;
}
