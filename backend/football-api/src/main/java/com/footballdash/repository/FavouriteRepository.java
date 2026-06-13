package com.footballdash.repository;

import com.footballdash.model.Favourite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface FavouriteRepository  extends JpaRepository<Favourite,Long> {

    List<Favourite> findByUserId(Long userId);

    Optional<Favourite> findByUserIdAndEntityTypeAndEntityId(Long userId, String entityType, Long entityId);

    boolean existsByUserIdAndEntityTypeAndEntityId(Long userId, String entityType, Long entityId);

    void deleteByUserIdAndEntityTypeAndEntityId(Long userId, String entityType, Long entityId);
}
