package com.footballdash.repository;

import com.footballdash.model.Team;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

//JpaRepository gives save() and findAll()
//findById() and deleteById() already exist so no implementation needed

@Repository
public interface TeamRepository extends JpaRepository<Team,Long> {

    // Auto-Generated at runtime by jpa repository
    Optional<Team> findByExternalId(Long externalId);

    // Auto-Generated at runtime by jpa repository
    List<Team> findByTeamNameContainingIgnoreCase(String name);

    //Checks that the team exists , Auto-Generated at runtime by jpa repository
    boolean existsByExternalId(Long externalId);

}
