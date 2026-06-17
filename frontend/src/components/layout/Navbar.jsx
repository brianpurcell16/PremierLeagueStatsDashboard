import { Link, useNavigate, useLocation } from 'react-router-dom';
import { useAuth } from '../../context/AuthContext';

export default function Navbar() {
    const { logout } = useAuth();
    const navigate = useNavigate();
    const { pathname } = useLocation();

    const handleLogout = () => {
        logout();
        navigate('/login');
    };

    const isActive = (path) => pathname === path ? 'active' : '';

    return(
        <nav className='navbar'>
            <Link to='/dashboard' className='navbar-brand'>
                PL Dashboard
            </Link>
            <div className='navbar-links'>
                <Link to='/dashboard' className={isActive('/dashboard')}>Matches</Link>
                <Link to='/teams' className={isActive('/teams')}>Teams</Link>
                <Link to='/players' className={isActive('/players')}>Players</Link>
                <Link to='/favourites' className={isActive('/favourites')}>Favourites</Link>
                <button onClick={handleLogout} className='btn-logout'>Log Out</button>
            </div>
        </nav>
    );
}