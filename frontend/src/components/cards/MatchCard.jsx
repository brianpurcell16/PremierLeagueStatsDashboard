export default function MatchCard({match}) {
    const isFinished = match.status === 'FINISHED';
    const isLive = ['IN_PLAY', 'PAUSED'].includes(match.status);

    return(
        <div className={`match-card ${isLive ? 'match-card--live' : ''}`}>
            {isLive && <span className="live-badge">LIVE</span>}
            <div className="match-teams">
                <span className="team-name home">{match.homeTeamName}</span>
                <span className="score">
                    {isFinished || isLive
                     ? `${match.homeScore ?? 0} - ${match.awayScore ?? 0}`
                     : 'vs'}
                </span>
                <span className="team-name away">{match.awayTeamName}</span>
            </div>
            <div className="match-meta">
                <span className={`status-badge status--${match.status.toLowerCase()}`}>
                    {match.status.replace('_', ' ')}
                </span>
                <span className="matchday">Matchday {match.matchday}</span>
            </div>
        </div>
    );
}