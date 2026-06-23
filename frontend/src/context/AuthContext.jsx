import { createContext, useContext, useState, useCallback } from "react";

const AuthContext = createContext(null);

/**
 * This file provides token state and authencation actions like login and logout to the whole app.
 * It initialises from localStorage so the user stays logged in when the page is refreshed.
 */

export function AuthProvider({ children }) {
  const [token, setToken] = useState(() => localStorage.getItem("token"));

  const login = useCallback((newToken) => {
    localStorage.setItem("token", newToken);
    setToken(newToken);
  }, []);

  const logout = useCallback(() => {
    localStorage.removeItem("token");
    setToken(null);
  }, []);

  return (
    <AuthContext.Provider value={{ token, login, logout, isAuth: !!token }}>
      {children}
    </AuthContext.Provider>
  );
}

export const useAuth = () => useContext(AuthContext);
