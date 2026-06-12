package com.footballdash.model;

import jakarta.persistence.*;
import lombok.*;

/** this table is for users saved teams or players,
 * the unique constraint stops users from favouring the same team or player twice and entity type is used to tell if it's a player or team
 */
@Entity
@Table(
        name = "favourites",
        uniqueConstraints = @UniqueConstraint(columnNames = {"user_id", "entity_type", "entity_id"}
        )
)
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Favourite {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id", nullable = false)
    private Long userId;

    @Column(name = "entity_type", nullable = false)
    private String entityType;

    @Column(name = "entity_id", nullable = false)
    private Long entityId;
}
