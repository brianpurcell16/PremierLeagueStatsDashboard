import { Navigate } from "react-router-dom";
import { useAuth } from "../../context/AuthContext";

/**
 * This wraps around any page that requires the user to be logged in and returns them to login page if they are not
 */

export default function ProtectedRoute({children}) {
    const {isAuth} = useAuth();
    return isAuth ? children : <Navigate to="/login" replace />;
}