package com.footballdash.repository;

import com.footballdash.model.Player;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface PlayerRepository extends JpaRepository<Player,Long> {

    Optional<Player> findByExternalId(Long externalId);
    List<Player> findByTeamId(Long teamId);
    List<Player> findByNameContainingIgnoreCase(String name);
    List<Player> findByNationality(String nationality);
}
