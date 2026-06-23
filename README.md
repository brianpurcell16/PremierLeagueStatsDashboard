# ⚽ Premier League Stats Dashboard

A full-stack football statistics dashboard I built as a personal project that combines my interest in football with learning new technologies. The backend is a Java Spring Boot REST API and the frontend is built with React 18. It uses JWT-based authentication so users can register and log in to save their favourite teams and players.

---

## Tech Stack

| Layer | Technology |
|---|---|
| Backend | Java 17, Spring Boot 3.3, Spring Security |
| Authentication | JWT — stateless, no sessions |
| ORM | Spring Data JPA + Hibernate |
| Database | PostgreSQL 16 |
| Frontend | React 18, React Router, Axios |
| Data Source | football-data.org REST API |

---

## Features

- Register and log in with JWT authentication — passwords are hashed with BCrypt before being stored
- Browse all 20 Premier League teams with their crests, stadiums and founding year
- View individual team pages showing the squad
- Search for players across all clubs
- Save favourite teams and players which are stored in the database per user
- Live match data synced from football-data.org
- All pages except login and register are protected and require a valid token

---

## Architecture

The backend follows a layered architecture which I had experience with from my time at Aspen Grove Solutions — it keeps everything separated and easier to maintain.

```
React Frontend (port 3000)
        │
        │  HTTP + JWT
        ▼
Spring Boot Backend (port 8080)
    ├── Controller Layer   (REST endpoints)
    ├── Security Layer     (JwtFilter, SecurityConfig)
    ├── Service Layer      (business logic + API sync)
    └── Repository Layer   (Spring Data JPA)
        │
        ▼
PostgreSQL Database
    ├── users
    ├── teams
    ├── players
    ├── matches
    └── favourites
```

---

## API Endpoints

| Method | Endpoint | Auth | Description |
|---|---|---|---|
| POST | /api/auth/register | No | Create an account |
| POST | /api/auth/login | No | Log in and get a JWT token |
| GET | /api/teams | Yes | All 20 Premier League teams |
| GET | /api/teams?search= | Yes | Search teams by name |
| GET | /api/teams/{id} | Yes | Get a specific team |
| GET | /api/matches | Yes | All matches |
| GET | /api/matches?matchday= | Yes | Matches for a specific matchday |
| GET | /api/players | Yes | All players |
| GET | /api/players?search= | Yes | Search players by name |
| GET | /api/players/team/{teamId} | Yes | Players for a specific team |
| GET | /api/favourites | Yes | The logged in user's favourites |
| POST | /api/favourites | Yes | Add a team or player to favourites |
| DELETE | /api/favourites | Yes | Remove a favourite |

---

## Running It Locally

### What you need installed

- Java 21 LTS ([Adoptium](https://adoptium.net))
- Apache Maven 3.9+
- Node.js 20 LTS
- PostgreSQL 16

### Database setup

```sql
CREATE DATABASE football_dashboard;
CREATE USER football_user WITH PASSWORD 'yourpassword';
GRANT ALL PRIVILEGES ON DATABASE football_dashboard TO football_user;
```

### Backend config

Edit `backend/football-api/src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/football_dashboard
spring.datasource.username=football_user
spring.datasource.password=yourpassword
football.api.key=YOUR_FOOTBALL_DATA_ORG_API_KEY
jwt.secret=yourSecretKeyAtLeast32CharactersLong
```

You can get a free API key at [football-data.org](https://www.football-data.org/client/register) — no card needed.

### Starting the backend

```bash
cd backend/football-api
mvn spring-boot:run
```

When it starts up for the first time Hibernate creates all the tables automatically. The first request to `/api/teams` triggers a sync from football-data.org and pulls all 20 Premier League teams into the database — after that it just serves from PostgreSQL.

### Starting the frontend

```bash
cd frontend
npm install
npm start
```

Opens at [http://localhost:3000](http://localhost:3000).

---

## Player Data

Squad data isn't available on the football-data.org free tier so I seeded the players manually. After the teams have synced, run `seed_players.sql` in pgAdmin to insert roughly 15 players per club across all 20 teams.

A paid plan (~€6/month) at football-data.org would give live squad data through the API, and the `syncSquad()` method in `FootballApiService` is already built to handle that if needed.

---

## Project Structure

```
football-dashboard/
├── backend/
│   └── football-api/
│       ├── src/main/java/com/footballdash/
│       │   ├── config/          ← SecurityConfig, RestTemplateConfig
│       │   ├── controller/      ← REST controllers
│       │   ├── dto/             ← Request/response body shapes
│       │   ├── model/           ← JPA entities
│       │   ├── repository/      ← Spring Data JPA interfaces
│       │   ├── security/        ← JwtUtil, JwtFilter, UserDetailsService
│       │   └── service/         ← Business logic + external API sync
│       └── pom.xml
└── frontend/
    └── src/
        ├── api/                 ← Axios instance + API call functions
        ├── components/          ← Reusable UI components
        ├── context/             ← AuthContext for JWT state
        ├── pages/               ← Dashboard, Teams, Players, Favourites
        └── styles/              ← Global CSS
```
