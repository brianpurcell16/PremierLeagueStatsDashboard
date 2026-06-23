import { useEffect, useState } from "react";
import { getFavourites, removeFavourite } from "../api/favouritesApi";
import { getTeamById } from "../api/teamsApi";
import { getPlayerById } from "../api/playersApi";

export default function Favourites() {
  const [items, setItems] = useState([]);
  const [loading, setLoading] = useState(true);

  const load = () => {
    setLoading(true);
    getFavourites()
      .then(async (r) => {
        // enriched refers to making a call to the database to get the full details for the ids that are favourited using the id and enitity type such as team or player
        const enriched = await Promise.all(
          r.data.map(async (fav) => {
            console.log("fav:", fav);
            console.log("entityId:", fav.entityId);
            console.log("typeof entityId:", typeof fav.entityId);
            const fn = fav.entityType === "TEAM" ? getTeamById : getPlayerById;
            const { data: entity } = await fn(fav.entityId);
            return { ...fav, entity };
          }),
        );
        setItems(enriched);
      })
      .finally(() => setLoading(false));
  };

  useEffect(() => {
    load();
  }, []);

  const handleRemove = async (fav) => {
    await removeFavourite(fav.entityType, fav.entityId);
    load(); //Refreshes the list
  };

  if (loading) return <div className="loading">Loading Favourites.....</div>;

  return (
    <div className="page">
      <h1 className="page-title">★ My Favourites</h1>
      {items.length === 0 && (
        <p className="empty-msg">
          No favourites yet. Go to Teams or Players to add some!
        </p>
      )}
      <div className="favourites-list">
        {items.map((fav) => (
          <div key={fav.id} className="favourite-row">
            <span className="fav-type-badge">{fav.entityType}</span>
            <span className="fav-name">{fav.entity?.name}</span>
            <button className="btn-remove" onClick={() => handleRemove(fav)}>
              Remove Favourite
            </button>
          </div>
        ))}
      </div>
    </div>
  );
}
