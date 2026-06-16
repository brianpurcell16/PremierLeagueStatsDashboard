import axios from 'axios';


/**
 * Central axios instance shared by all API modules.
 * The request interceptor reads the token from localStorage and attaches it to every outgoing request automatically.
 * This means that no page or component needs to deal with authentication headers as this handles it.
 */

const api = axios.create({
    baseURL: process.env.REACT_APP_API_URL,
    headers: { 'Content-Type': 'application/json'},
});

api.interceptors.request.use((config) => {
    const token = localStorage.getItem('token');
    if(token){
        config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
});

export default api;