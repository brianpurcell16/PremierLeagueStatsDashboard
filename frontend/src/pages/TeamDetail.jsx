import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { getTeamById } from "../api/teamsApi";
import api from "../api/axios";

export default function TeamDetail() {
  const { id } = useParams();
  const [team, setTeam] = useState(null);
  const [players, setPlayers] = useState([]);

  useEffect(() => {
    getTeamById(id).then((r) => {
      setTeam(r.data);
      // Fetch players for this team
      api.get(`/players/team/${id}`).then((pr) => setPlayers(pr.data));
    });
  }, [id]);

  if (!team) return <div className="loading">Loading team...</div>;

  return (
    <div className="page">
      <div
        style={{
          display: "flex",
          alignItems: "center",
          gap: "1rem",
          marginBottom: "2rem",
        }}
      >
        <img src={team.crest} alt={team.name} width={80} />
        <div>
          <h1 className="page-title" style={{ marginBottom: "0.25rem" }}>
            {team.name}
          </h1>
          <p style={{ color: "var(--muted)" }}>{team.venue}</p>
          <p style={{ color: "var(--muted)" }}>Founded: {team.founded}</p>
          <p style={{ color: "var(--muted)" }}>Colours: {team.clubColours}</p>
        </div>
      </div>

      <h2 className="section-title">Squad</h2>
      {players.length === 0 ? (
        <p className="empty-msg">No squad data available yet.</p>
      ) : (
        <div className="teams-grid">
          {players.map((p) => (
            <div key={p.id} className="player-card">
              <div className="player-info">
                <h3>{p.name}</h3>
                <p>{p.position}</p>
                <p className="player-meta">{p.nationality}</p>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
