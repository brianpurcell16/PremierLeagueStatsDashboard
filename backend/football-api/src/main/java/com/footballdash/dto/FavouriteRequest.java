package com.footballdash.dto;
import lombok.Data;

/**
 * This dto is similar to AuthRequest as it is used so that the id cannot be sent in the request
 */
@Data
public class FavouriteRequest {
    private String type;
    private Long entityId;
}
