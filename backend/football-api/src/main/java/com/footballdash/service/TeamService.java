package com.footballdash.service;

import com.footballdash.model.Team;
import com.footballdash.repository.TeamRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class TeamService {

    private final TeamRepository teamRepository;
    private final FootballApiService footballApiService;

    public List<Team> getAllTeams() {
        if(teamRepository.count() == 0) {
            footballApiService.syncTeams();
        }
        return teamRepository.findAll();
    }

    public Optional<Team> getById(Long id) {
        return teamRepository.findById(id);
    }

    public List<Team> search(String query) {
        return teamRepository.findByNameContainingIgnoreCase(query);
    }
}
