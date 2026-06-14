package com.footballdash.service;

import com.footballdash.model.Favourite;
import com.footballdash.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@RequiredArgsConstructor
public class FavouriteService {

    private final FavouriteRepository favouriteRepository;
    private final UserRepository userRepository;

    /** Getting userid from the database using the username*/
    private Long resolveUserId(String username){
        return userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found" + username))
                .getId();
    }

    public List<Favourite> getForUser(String username){
        return favouriteRepository.findByUserId(resolveUserId(username));
    }

    @Transactional
    public Favourite addFavourite(String username, String type, Long entityId){
        Long userId = resolveUserId(username);
        //Guarding against duplicates by returning an error using the DB unique constraint

        if(favouriteRepository.existsByUserIdAndEntityTypeAndEntityId(userId,type.toUpperCase(),entityId)){
            throw new RuntimeException("That already exists in your favourites");
        }
        return favouriteRepository.save(Favourite.builder()
                .userId(userId)
                .entityType(type.toUpperCase())
                .entityId(entityId)
                .build());

    }

    @Transactional
    public void removeFavourite(String username, String type, Long entityId){
        favouriteRepository.deleteByUserIdAndEntityTypeAndEntityId(resolveUserId(username),type.toUpperCase(),entityId);
    }
}
