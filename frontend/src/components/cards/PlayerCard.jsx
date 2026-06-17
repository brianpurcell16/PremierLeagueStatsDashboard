import { useState } from "react";
import { addFavourite, removeFavourite } from "../../api/favouritesApi";

export default function PlayerCard({ player, isFavourited, onToggle}) {
    const [loading, setLoading] = useState(false);

    const handleToggle = async () => {
        setLoading(true);
        try {
            if(isFavourited){
                await removeFavourite('PLAYER', player.id);
            }else{
                await addFavourite('PLAYER', player.id);
            }
            onToggle();
        }finally{
            setLoading(false);
        }
    };


     return (
    <div className="player-card">
      <div className="player-info">
        <h3>{player.name}</h3>
        <p>{player.position}</p>
        <p className="player-meta">🏳️ {player.nationality}</p>
      </div>
      <button
        onClick={handleToggle}
        disabled={loading}
        className={`fav-btn ${isFavourited ? 'fav-btn--active' : ''}`}
      >
        {isFavourited ? '★' : '☆'}
      </button>
    </div>
  );


}