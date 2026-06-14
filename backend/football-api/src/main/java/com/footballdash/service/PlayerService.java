package com.footballdash.service;

import com.footballdash.model.Player;
import com.footballdash.repository.PlayerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class PlayerService {

    private final PlayerRepository playerRepository;

    public List<Player> getAll(){
        return playerRepository.findAll();
    }

    public Optional<Player> getById(Long id){
        return playerRepository.findById(id);
    }

    public List<Player> getByTeam(Long teamId){
        return playerRepository.findByTeamId(teamId);
    }

    public List<Player> search(String query){
        return playerRepository.findByNameContainingIgnoreCase(query);
    }
}
