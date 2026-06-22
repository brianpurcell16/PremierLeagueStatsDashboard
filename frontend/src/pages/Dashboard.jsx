import { useEffect, useState } from "react";
import { getMatches } from "../api/matchesApi";
import MatchCard from "../components/cards/MatchCard";

export default function Dashboard() {
  const [matches, setMatches] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    getMatches()
      .then((r) => setMatches(r.data))
      .catch(() => setError("Failed to load match data. "))
      .finally(() => setLoading(false));
  }, []);

  if (loading) return <div className="loading">Loading matches...</div>;
  if (error) return <div className="error-msg">{error}</div>;

  const finished = matches.filter((m) => m.status === "FINISHED");
  const live = matches.filter((m) => ["IN_PLAY", "PAUSED"].includes(m.status));
  const upcoming = matches.filter((m) => m.status === "SCHEDULED");

  return (
    <div className="page">
      <h1 className="page-title">Premier League Dashboard</h1>

      {live.length > 0 && (
        <section>
          <h2 className="section-title">Live Now</h2>
          <div className="matches-grid">
            {live.map((m) => (
              <MatchCard key={m.id} match={m} />
            ))}
          </div>
        </section>
      )}

      {upcoming.length > 0 && (
        <section>
          <h2 className="section-title">Upcoming</h2>
          <div className="matches-grid">
            {upcoming.slice(0, 6).map((m) => (
              <MatchCard key={m.id} match={m} />
            ))}
          </div>
        </section>
      )}

      <section>
        <h2 className="section-title">Results</h2>
        <div className="matches-grid">
          {finished.map((m) => (
            <MatchCard key={m.id} match={m} />
          ))}
        </div>
      </section>
    </div>
  );
}
