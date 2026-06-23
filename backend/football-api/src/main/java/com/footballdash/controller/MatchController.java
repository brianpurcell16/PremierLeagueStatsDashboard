package com.footballdash.controller;

import com.footballdash.model.Match;
import com.footballdash.service.MatchService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/matches")
@RequiredArgsConstructor
public class MatchController {

    private final MatchService matchService;

    /**
     * GET /api/matches - returns all matches
     * GET /api/matches?matchday=5 - returns matches for a given day that is provided
     */

    @GetMapping
    public List<Match> getMatches(
            @RequestParam(required = false) Integer matchday) {
        if (matchday != null) {
            return matchService.getByMatchDay(matchday);
        }
        return matchService.getAll();
    }
}
