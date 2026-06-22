import { useEffect, useState, useCallback } from "react";
import { getTeams, searchTeams } from "../api/teamsApi";
import { getFavourites } from "../api/favouritesApi";
import TeamCard from "../components/cards/TeamCard";

export default function Teams() {
  const [teams, setTeams] = useState([]);
  const [favs, setFavs] = useState([]);
  const [query, setQuery] = useState("");
  const [loading, setLoading] = useState(true);

  const loadFavs = useCallback(() => {
    getFavourites().then((r) =>
      setFavs(r.data.filter((f) => f.entityType === "TEAM")),
    );
  }, []);

  useEffect(() => {
    Promise.all([getTeams(), getFavourites()])
      .then(([tr, fr]) => {
        setTeams(tr.data);
        setFavs(fr.data.filter((f) => f.entityType === "TEAM"));
      })
      .finally(() => setLoading(false));
  }, []);

  //debounced search so it waits for 350ms after the last keystroke before searching
  useEffect(() => {
    if (!query.trim()) {
      getTeams().then((r) => setTeams(r.data)); //r signifies response as in the response from the backend
      return;
    }
    const timer = setTimeout(() => {
      searchTeams(query).then((r) => setTeams(r.data));
    }, 350);
    return () => clearTimeout(timer);
  }, [query]);

  if (loading) return <div className="loading">Loading all the teams ....</div>;

  return (
    <div className="page">
      <h1 className="page-title">Premier League Teams</h1>
      <input
        className="search-input"
        placeholder="Search Teams...."
        value={query}
        onChange={(e) => setQuery(e.target.value)}
      />
      <div className="teams-grid">
        {teams.map((t) => (
          <TeamCard
            key={t.id}
            team={t}
            isFavourited={favs.some((f) => f.entityId === t.id)}
            onToggle={loadFavs}
          />
        ))}
      </div>
      {teams.length === 0 && (
        <p className="empty-msg"> No teams found for the query "{query}"</p>
      )}
    </div>
  );
}
