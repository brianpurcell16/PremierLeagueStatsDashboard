package com.footballdash.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.footballdash.model.*;
import com.footballdash.repository.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 * THis file calls the football-data.org API and syncs the data into the local database.
 * On the first request to /api/teams the local DB is empty, so this service
 * is triggered to populate it. Requests after the first one return
 * cached data directly from the Postgres database
 */

@Service
@RequiredArgsConstructor
@Slf4j
public class FootballApiService {

    @Value("${football.api.key}")
    private String apiKey;

    @Value("${football.api.base-url}")
    private String baseUrl;

    private final RestTemplate restTemplate;
    private final TeamRepository teamRepository;
    private final MatchRepository matchRepository;
    private final PlayerRepository playerRepository;

    /** Must build the headers that include the api key used for every external request */
    private HttpEntity<Void> withAuthHeaders(){
        HttpHeaders headers = new HttpHeaders();
        headers.set("X-Auth-Token", apiKey);
        return new HttpEntity<>(headers);
    };

    /** Fetch all premier league teams and update or insert them into the DB */
    public void syncTeams() {
        log.info("Syncing PL teams from football-data.org...");
        String url = baseUrl + "/competitions/PL/teams";
        ResponseEntity<JsonNode> response = restTemplate.exchange(
                url, HttpMethod.GET, withAuthHeaders(), JsonNode.class);

        for (JsonNode t : response.getBody().get("teams")) {
            Long extId = t.get("id").asLong();
            Team team = teamRepository.findByExternalId(extId)
                    .orElse(new Team());
            team.setExternalId(extId);
            team.setName(t.get("name").asText());
            team.setShortName(t.path("shortName").asText(""));
            team.setTla(t.path("tla").asText(""));
            team.setCrest(t.path("crest").asText(""));
            team.setVenue(t.path("venue").asText(""));
            team.setFounded(t.path("founded").asText(""));
            team.setWebsite(t.path("website").asText(""));
            team.setClubColours(t.path("clubColors").asText(""));
            team = teamRepository.save(team);

            // Sync squad from the same response — no extra API call needed
            JsonNode squad = t.get("squad");
            if (squad != null && squad.isArray() && squad.size() > 0) {
                for (JsonNode p : squad) {
                    Long playerExtId = p.get("id").asLong();
                    Player player = playerRepository.findByExternalId(playerExtId)
                            .orElse(new Player());
                    player.setExternalId(playerExtId);
                    player.setName(p.get("name").asText());
                    player.setPosition(p.path("position").asText(""));
                    player.setNationality(p.path("nationality").asText(""));
                    player.setTeamId(team.getId());
                    playerRepository.save(player);
                }
                log.info("Saved {} players for {}", squad.size(), team.getName());
            } else {
                log.warn("No squad data in response for {}", team.getName());
            }
        }
        log.info("Team and squad sync complete.");
    }

    /** Fetches and stores all matches for the preimer league matchday that is passed in*/
    public void syncMatches(int matchday){
        log.info("Syncing the matches from football-data.org for matchday {} with the local database ......", matchday);
        String url = baseUrl + "/competitions/PL/matches?matchday=" + matchday;
        ResponseEntity<JsonNode> response = restTemplate.exchange(url, HttpMethod.GET, withAuthHeaders(), JsonNode.class);

        for(JsonNode m : response.getBody().get("matches")){
            Long extId = m.get("id").asLong();
            Match match = matchRepository.findByExternalId(extId).orElse(new Match());
            match.setExternalId(extId);
            match.setHomeTeamName(m.get("homeTeam").get("name").asText(""));
            match.setAwayTeamName(m.get("awayTeam").get("name").asText(""));
            match.setHomeTeamExternalId(m.get("homeTeam").get("id").asLong());
            match.setAwayTeamExternalId(m.get("awayTeam").get("id").asLong());
            match.setStatus(m.get("status").asText());
            match.setMatchday(matchday);
            JsonNode ft = m.get("score").get("fullTime");
            match.setHomeScore(ft.get("home").isNull() ? null : ft.get("home").asInt());
            match.setAwayScore(ft.get("away").isNull() ? null : ft.get("away").asInt());
            matchRepository.save(match);

        }
    }

    /** Fetches and stores a squad for team id that is passed in*/
    public void syncSquad(Long teamExternalId) {
        log.info("Syncing squad for team {}...", teamExternalId);
        try {
            String url = baseUrl + "/teams/" + teamExternalId;
            ResponseEntity<JsonNode> response = restTemplate.exchange(
                    url, HttpMethod.GET, withAuthHeaders(), JsonNode.class);

            JsonNode squad = response.getBody().get("squad");
            if (squad == null || !squad.isArray()) {
                log.warn("No squad data returned for team {}", teamExternalId);
                return;
            }
            for (JsonNode p : squad) {
                // ... existing save logic
            }
            log.info("Squad sync complete for team {}. {} players saved.",
                    teamExternalId, playerRepository.findByTeamId(teamExternalId).size());

        } catch (Exception e) {
            log.error("Failed to sync squad for team {}: {}", teamExternalId, e.getMessage());
        }
    }
}
