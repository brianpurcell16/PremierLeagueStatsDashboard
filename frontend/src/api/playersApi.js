import api from "./axios";

export const getPlayers = () => api.get('/players');
export const getPlayersById = (id) => api.get(`/players/${id}`);
export const searchPlayers = (query) => api.get(`/players?search=${query}`);
export const getByTeam = (tid) => api.get(`/players/team/${tid}`);