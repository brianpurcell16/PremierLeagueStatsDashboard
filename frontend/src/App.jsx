import { BrowserRouter, Routes, Route, Navigate } from "react-router-dom";
import { AuthProvider } from "./context/AuthContext";
import ProtectedRoute from "./components/auth/ProtectedRoute";
import Navbar from "./components/layout/Navbar";
import Login from "./pages/Login";
import Register from "./pages/Register";
import Dashboard from "./pages/Dashboard";
import Teams from "./pages/Teams";
import Players from "./pages/Players";
import Favourites from "./pages/Favourites";
import TeamDetail from "./pages/TeamDetail";

/** Wraps a protected page with the navigation bar */
function ProtectedLayout({ children }) {
  return (
    <ProtectedRoute>
      <Navbar />
      <main className="main-content">{children}</main>
    </ProtectedRoute>
  );
}

export default function App() {
  return (
    <AuthProvider>
      <BrowserRouter>
        <Routes>
          {/* Public routes */}
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />

          {/* Protected routes — redirect to /login if unauthenticated */}
          <Route
            path="/dashboard"
            element={
              <ProtectedLayout>
                <Dashboard />
              </ProtectedLayout>
            }
          />
          <Route
            path="/teams"
            element={
              <ProtectedLayout>
                <Teams />
              </ProtectedLayout>
            }
          />
          <Route
            path="/players"
            element={
              <ProtectedLayout>
                <Players />
              </ProtectedLayout>
            }
          />
          <Route
            path="/favourites"
            element={
              <ProtectedLayout>
                <Favourites />
              </ProtectedLayout>
            }
          />
          <Route
            path="/teams/:id"
            element={
              <ProtectedLayout>
                <TeamDetail />
              </ProtectedLayout>
            }
          />
          {/* Redirect any unknown path to login */}
          <Route path="*" element={<Navigate to="/login" replace />} />
        </Routes>
      </BrowserRouter>
    </AuthProvider>
  );
}
