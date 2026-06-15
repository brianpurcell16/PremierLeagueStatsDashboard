package com.footballdash.controller;

import com.footballdash.dto.FavouriteRequest;
import com.footballdash.model.Favourite;
import com.footballdash.service.FavouriteService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/favourites")
@RequiredArgsConstructor
public class FavouriteController {

    private final FavouriteService favouriteService;

    /**
     * GET api/favourites
     * Authentication is injected by Spring from the token in the request
     */
    @GetMapping
    public List<Favourite> getFavourites(Authentication authentication){
        return favouriteService.getForUser(authentication.getName());
    }

    /**
     *  POST /api/favourites - body: {"type" : "TEAM", "entityId" : 5}
     */
    @PostMapping
    public ResponseEntity<Favourite> addFavourite(Authentication authentication ,@RequestBody FavouriteRequest favouriteRequest){
        Favourite favourite = favouriteService.addFavourite(authentication.getName(), favouriteRequest.getType(), favouriteRequest.getEntityId());
        return ResponseEntity.ok(favourite);
    }

    /**
     * DELETE /api/favourites?type=TEAM&entityId=5
     */
    @DeleteMapping
    public ResponseEntity<Void> removeFavourite(Authentication authentication ,@RequestParam String type, @RequestParam Long entityId){
        favouriteService.removeFavourite(authentication.getName(), type, entityId);
        return ResponseEntity.noContent().build();
    }
}
