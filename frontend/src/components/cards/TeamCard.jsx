import { useState } from "react";
import { Link } from "react-router-dom";
import { addFavourite, removeFavourite } from '../../api/favouritesApi';

export default function TeamCard({ team, isFavourited, onToggle}) {
    const [loading, setLoading] = useState(false);

    const handleToggle = async (e) => {
        e.preventDefault(); //prevent Link navigation on button click
        setLoading(true);
        try {
            if(isFavourited) {
                await removeFavourite('TEAM', team.id);
            }else {
                await addFavourite('TEAM', team.id);
            }
            onToggle(); // tells the parent to refresh favourites
        } catch (err){
            console.error('Favourite toggle failed:', err);
        }finally {
            setLoading(false);
        }
    };


    return (
        <Link to={`/teams/${team.id}`} className="team-card">
            <img src={team.crest} alt={`${team.name} badge`} className="team-crest" onError={e => e.target.style.display='none'} />
            <div className="team-info">
                <h3 className="team-name">{team.name}</h3>
                <p className="team-meta">{team.venue}</p>
                <p className="team-meta">Est. {team.founded}</p>
            </div>
            <button
            onClick={handleToggle}
            disabled={loading}
            className={`fav-btn ${isFavourited ? 'fav-btn--active' : ''}`}
            aria-label={isFavourited ? 'Remove from favourites' : 'Add to favourites'}
            >
                {isFavourited ? '★' : '☆'}
            </button>
        </Link>
    );

}