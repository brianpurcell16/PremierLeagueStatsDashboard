import api from "./axios";

export const getFavourites = () => api.get('/favourites');
export const addFavourite = (type, entityId) => api.post('/favourites', {type, entityId});
export const removeFavourite = (type, entityId) => api.delete(`/favourites?type=${type}&entityId=${entityId}`);