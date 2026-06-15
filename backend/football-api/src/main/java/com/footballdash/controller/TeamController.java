package com.footballdash.controller;

import com.footballdash.model.Team;
import com.footballdash.service.TeamService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/teams")
@RequiredArgsConstructor
public class TeamController {

    private final TeamService teamService;

    /**
     * GET /api/teams returns all 20 PL Teams
     * but if a search option is provided it returns that team
     * GET /api/teams?search=Arsenal - returns matching teams
     */
    @GetMapping
    public List<Team> getTeams(@RequestParam(required = false) String search) {
        if(search != null && !search.isEmpty()){
            return teamService.search(search);
        }
        return teamService.getAllTeams();

    }

    /** GET /api/teams/{id} */
    @GetMapping("/{id}")
    public ResponseEntity<Team> getById(@PathVariable Long id) {
        return teamService.getById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
}
