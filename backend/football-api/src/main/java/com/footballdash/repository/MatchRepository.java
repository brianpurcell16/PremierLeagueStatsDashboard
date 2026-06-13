package com.footballdash.repository;

import com.footballdash.model.Match;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface MatchRepository extends JpaRepository<Match,Long> {

    Optional<Match> findByExternalId(Long externalId);

    //Gets all matches for a certain matchday sorting them by their kick-off time
    List<Match> findByMatchdayOrderByUtcDateAsc(Integer matchday);

    //Gathers all matches by a specified status
    List<Match> findByStatusOrderByUtcDateAsc(String status);

    //Finds all matches that involve a specified team
    List<Match> findByHomeTeamExternalIdOrAwayTeamExternalId(Long homeId, Long awayId);
}
