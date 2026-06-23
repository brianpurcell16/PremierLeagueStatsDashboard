import { useEffect, useState, useCallback } from "react";
import { getPlayers, searchPlayers } from "../api/playersApi";
import { getFavourites } from "../api/favouritesApi";
import PlayerCard from "../components/cards/PlayerCard";

export default function Players() {
  const [players, setPlayers] = useState([]);
  const [favs, setFavs] = useState([]);
  const [query, setQuery] = useState("");
  const [loading, setLoading] = useState(true);

  const loadFavs = useCallback(() => {
    getFavourites().then((r) =>
      setFavs(r.data.filter((f) => f.entityType === "PLAYER")),
    );
  }, []);

  useEffect(() => {
    Promise.all([getPlayers(), getFavourites()])
      .then(([pr, fr]) => {
        setPlayers(pr.data);
        setFavs(fr.data.filter((f) => f.entityType === "PLAYER"));
      })
      .finally(() => setLoading(false));
  }, []);

  // Debounced search
  useEffect(() => {
    if (!query.trim()) {
      getPlayers().then((r) => setPlayers(r.data));
      return;
    }
    const timer = setTimeout(() => {
      searchPlayers(query).then((r) => setPlayers(r.data));
    }, 350);
    return () => clearTimeout(timer);
  }, [query]);

  if (loading) return <div className="loading">Loading players...</div>;

  return (
    <div className="page">
      <h1 className="page-title">Premier League Players</h1>
      <input
        className="search-input"
        placeholder="Search players..."
        value={query}
        onChange={(e) => setQuery(e.target.value)}
      />
      <div className="teams-grid">
        {players.map((p) => (
          <PlayerCard
            key={p.id}
            player={p}
            isFavourited={favs.some((f) => f.entityId === p.id)}
            onToggle={loadFavs}
          />
        ))}
      </div>
      {players.length === 0 && (
        <p className="empty-msg">No players found for "{query}"</p>
      )}
    </div>
  );
}
