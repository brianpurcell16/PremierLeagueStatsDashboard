import api from "./axios";

export const getMatches = () => api.get('/matches');
export const getByMatchday = (matchday) => api.get(`/matches?matchday=${matchday}`);