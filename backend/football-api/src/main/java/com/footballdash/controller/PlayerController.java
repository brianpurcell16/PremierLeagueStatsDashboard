package com.footballdash.controller;

import com.footballdash.model.Player;
import com.footballdash.repository.TeamRepository;
import com.footballdash.service.FootballApiService;
import com.footballdash.service.PlayerService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

@RestController
@RequestMapping("/api/players")
@RequiredArgsConstructor

public class PlayerController {

    private final PlayerService playerService;
    private final TeamRepository teamRepository;
    private final FootballApiService footballApiService;

    /** GET /api/players or GET /api/players?search=saka */
    @GetMapping
    public List<Player> getAllPlayers(@RequestParam(required = false) String search) {
        if(search != null && !search.isBlank()){
            return playerService.search(search);
        }
        return playerService.getAll();
    }

    /** GET api/players/{id} */
    @GetMapping("/{id}")
    public ResponseEntity<Player> getById(@PathVariable Long id){
        return playerService.getById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    /** GET /api/players?teamId=3 - returns all players for the provided team id*/


    @GetMapping("/team/{teamId}")
    public List<Player> getByTeam(@PathVariable Long teamId) {
        return playerService.getByTeam(teamId);
    }
}
