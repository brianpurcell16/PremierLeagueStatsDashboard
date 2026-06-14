package com.footballdash.service;

import com.footballdash.model.Match;
import com.footballdash.repository.MatchRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MatchService {

    private final MatchRepository matchRepository;
    private final FootballApiService footballApiService;

    public List<Match> getByMatchDay(int matchDay) {
        List<Match> matches = matchRepository.findByMatchdayOrderByUtcDateAsc(matchDay);
        if(matches.isEmpty()){
            footballApiService.syncMatches(matchDay);
            return matchRepository.findByMatchdayOrderByUtcDateAsc(matchDay);
        }
        return matches;
    }

    public List<Match> getAll(){
        return matchRepository.findAll();
    }
}
