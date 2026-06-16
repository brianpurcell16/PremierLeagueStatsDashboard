import api from "./axios";


export const getTeams = () => api.get('/teams');
export const getTeamsById = (id) => api.get(`/teams/${id}`);
export const searchTeams = (query) => api.get(`/teams?search=${query}`);