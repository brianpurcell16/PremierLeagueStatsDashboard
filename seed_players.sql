-- ============================================================
-- Premier League 2026/27 — Player Seed Data
-- Run this in pgAdmin Query Tool after teams have been synced.
-- Steps:
--   1. Run your Spring Boot app once so teams table is populated
--   2. Run this entire script in pgAdmin Query Tool
-- ============================================================

-- First clear any existing player data
DELETE FROM players;

-- ============================================================
-- ARSENAL FC
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'Arsenal FC';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (44,    'Bukayo Saka',          'Right Winger',      'England',   team_id),
  (74,    'Martin Odegaard',      'Attacking Midfield','Norway',    team_id),
  (3224,  'Declan Rice',          'Central Midfield',  'England',   team_id),
  (7392,  'Gabriel Martinelli',   'Left Winger',       'Brazil',    team_id),
  (154,   'David Raya',           'Goalkeeper',        'Spain',     team_id),
  (8966,  'Gabriel Magalhaes',    'Centre-Back',       'Brazil',    team_id),
  (6905,  'William Saliba',       'Centre-Back',       'France',    team_id),
  (3141,  'Ben White',            'Right-Back',        'England',   team_id),
  (9587,  'Oleksandr Zinchenko',  'Left-Back',         'Ukraine',   team_id),
  (3655,  'Thomas Partey',        'Defensive Midfield','Ghana',     team_id),
  (8672,  'Kai Havertz',          'Centre-Forward',    'Germany',   team_id),
  (9467,  'Leandro Trossard',     'Left Winger',       'Belgium',   team_id),
  (9236,  'Jakub Kiwior',         'Centre-Back',       'Poland',    team_id),
  (7459,  'Jurrien Timber',       'Right-Back',        'Netherlands',team_id),
  (6720,  'Aaron Ramsdale',       'Goalkeeper',        'England',   team_id);
END $$;

-- ============================================================
-- ASTON VILLA FC
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'Aston Villa FC';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (9048,  'Emiliano Martinez',    'Goalkeeper',        'Argentina', team_id),
  (8864,  'Ollie Watkins',        'Centre-Forward',    'England',   team_id),
  (8652,  'Leon Bailey',          'Right Winger',      'Jamaica',   team_id),
  (9162,  'Moussa Diaby',         'Right Winger',      'France',    team_id),
  (7896,  'John McGinn',          'Central Midfield',  'Scotland',  team_id),
  (8234,  'Douglas Luiz',         'Central Midfield',  'Brazil',    team_id),
  (6543,  'Ezri Konsa',           'Centre-Back',       'England',   team_id),
  (7821,  'Tyrone Mings',         'Centre-Back',       'England',   team_id),
  (9321,  'Lucas Digne',          'Left-Back',         'France',    team_id),
  (8543,  'Matty Cash',           'Right-Back',        'Poland',    team_id),
  (9654,  'Youri Tielemans',      'Central Midfield',  'Belgium',   team_id),
  (8901,  'Pau Torres',           'Centre-Back',       'Spain',     team_id),
  (7234,  'Nicolo Zaniolo',       'Attacking Midfield','Italy',     team_id),
  (9876,  'Morgan Rogers',        'Attacking Midfield','England',   team_id),
  (6789,  'Boubacar Kamara',      'Defensive Midfield','France',    team_id);
END $$;

-- ============================================================
-- AFC BOURNEMOUTH
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'AFC Bournemouth';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (7651,  'Neto',                 'Goalkeeper',        'Brazil',    team_id),
  (8123,  'Dominic Solanke',      'Centre-Forward',    'England',   team_id),
  (9012,  'Marcus Tavernier',     'Right Winger',      'England',   team_id),
  (7345,  'Ryan Christie',        'Attacking Midfield','Scotland',  team_id),
  (8456,  'Philip Billing',       'Central Midfield',  'Denmark',   team_id),
  (9567,  'Lloyd Kelly',          'Centre-Back',       'England',   team_id),
  (7890,  'Chris Mepham',         'Centre-Back',       'Wales',     team_id),
  (8901,  'Adam Smith',           'Right-Back',        'England',   team_id),
  (9234,  'Milos Kerkez',         'Left-Back',         'Hungary',   team_id),
  (7123,  'Dango Ouattara',       'Right Winger',      'Burkina Faso',team_id),
  (8567,  'Antoine Semenyo',      'Left Winger',       'Ghana',     team_id),
  (9678,  'Justin Kluivert',      'Left Winger',       'Netherlands',team_id),
  (7456,  'David Brooks',         'Attacking Midfield','Wales',     team_id),
  (8789,  'Tyler Adams',          'Defensive Midfield','USA',       team_id),
  (9890,  'Illia Zabarnyi',       'Centre-Back',       'Ukraine',   team_id);
END $$;

-- ============================================================
-- BRENTFORD FC
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'Brentford FC';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (8234,  'Mark Flekken',         'Goalkeeper',        'Netherlands',team_id),
  (7654,  'Bryan Mbeumo',         'Right Winger',      'Cameroon',  team_id),
  (9345,  'Ivan Toney',           'Centre-Forward',    'England',   team_id),
  (8456,  'Yoane Wissa',          'Centre-Forward',    'DR Congo',  team_id),
  (7567,  'Christian Norgaard',   'Central Midfield',  'Denmark',   team_id),
  (9678,  'Vitaly Janelt',        'Central Midfield',  'Germany',   team_id),
  (8789,  'Ben Mee',              'Centre-Back',       'England',   team_id),
  (7890,  'Ethan Pinnock',        'Centre-Back',       'Jamaica',   team_id),
  (9901,  'Kristoffer Ajer',      'Right-Back',        'Norway',    team_id),
  (8012,  'Rico Henry',           'Left-Back',         'England',   team_id),
  (7123,  'Mathias Jensen',       'Central Midfield',  'Denmark',   team_id),
  (9234,  'Mikkel Damsgaard',     'Attacking Midfield','Denmark',   team_id),
  (8345,  'Keane Lewis-Potter',   'Left Winger',       'England',   team_id),
  (7456,  'Josh Dasilva',         'Central Midfield',  'England',   team_id),
  (9567,  'Thomas Strakosha',     'Goalkeeper',        'Albania',   team_id);
END $$;

-- ============================================================
-- BRIGHTON & HOVE ALBION FC
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'Brighton & Hove Albion FC';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (7321,  'Bart Verbruggen',      'Goalkeeper',        'Netherlands',team_id),
  (9432,  'Joao Pedro',           'Centre-Forward',    'Brazil',    team_id),
  (8543,  'Danny Welbeck',        'Centre-Forward',    'England',   team_id),
  (7654,  'Kaoru Mitoma',         'Left Winger',       'Japan',     team_id),
  (9765,  'Pascal Gross',         'Attacking Midfield','Germany',   team_id),
  (8876,  'James Milner',         'Central Midfield',  'England',   team_id),
  (7987,  'Lewis Dunk',           'Centre-Back',       'England',   team_id),
  (9098,  'Igor',                 'Centre-Back',       'Brazil',    team_id),
  (8109,  'Tariq Lamptey',        'Right-Back',        'Ghana',     team_id),
  (7210,  'Pervis Estupinan',     'Left-Back',         'Ecuador',   team_id),
  (9321,  'Billy Gilmour',        'Central Midfield',  'Scotland',  team_id),
  (8432,  'Adam Lallana',         'Attacking Midfield','England',   team_id),
  (7543,  'Facundo Buonanotte',   'Attacking Midfield','Argentina', team_id),
  (9654,  'Evan Ferguson',        'Centre-Forward',    'Ireland',   team_id),
  (8765,  'Jason Steele',         'Goalkeeper',        'England',   team_id);
END $$;

-- ============================================================
-- CHELSEA FC
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'Chelsea FC';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (9123,  'Robert Sanchez',       'Goalkeeper',        'Spain',     team_id),
  (8234,  'Nicolas Jackson',      'Centre-Forward',    'Senegal',   team_id),
  (7345,  'Cole Palmer',          'Attacking Midfield','England',   team_id),
  (9456,  'Raheem Sterling',      'Left Winger',       'England',   team_id),
  (8567,  'Enzo Fernandez',       'Central Midfield',  'Argentina', team_id),
  (7678,  'Moises Caicedo',       'Defensive Midfield','Ecuador',   team_id),
  (9789,  'Reece James',          'Right-Back',        'England',   team_id),
  (8890,  'Ben Chilwell',         'Left-Back',         'England',   team_id),
  (7901,  'Thiago Silva',         'Centre-Back',       'Brazil',    team_id),
  (9012,  'Wesley Fofana',        'Centre-Back',       'France',    team_id),
  (8123,  'Conor Gallagher',      'Central Midfield',  'England',   team_id),
  (7234,  'Noni Madueke',         'Right Winger',      'England',   team_id),
  (9345,  'Christopher Nkunku',   'Centre-Forward',    'France',    team_id),
  (8456,  'Axel Disasi',          'Centre-Back',       'France',    team_id),
  (7567,  'Malo Gusto',           'Right-Back',        'France',    team_id);
END $$;

-- ============================================================
-- CRYSTAL PALACE FC
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'Crystal Palace FC';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (8901,  'Dean Henderson',       'Goalkeeper',        'England',   team_id),
  (7012,  'Eberechi Eze',         'Attacking Midfield','England',   team_id),
  (9123,  'Michael Olise',        'Right Winger',      'France',    team_id),
  (8234,  'Jean-Philippe Mateta', 'Centre-Forward',    'France',    team_id),
  (7345,  'Odsonne Edouard',      'Centre-Forward',    'France',    team_id),
  (9456,  'Marc Guehi',           'Centre-Back',       'England',   team_id),
  (8567,  'Joachim Andersen',     'Centre-Back',       'Denmark',   team_id),
  (7678,  'Nathaniel Clyne',      'Right-Back',        'England',   team_id),
  (9789,  'Tyrick Mitchell',      'Left-Back',         'England',   team_id),
  (8890,  'Cheick Doucoure',      'Defensive Midfield','Mali',      team_id),
  (7901,  'Jeffrey Schlupp',      'Left Winger',       'Ghana',     team_id),
  (9012,  'Will Hughes',          'Central Midfield',  'England',   team_id),
  (8123,  'Naouirou Ahamada',     'Central Midfield',  'France',    team_id),
  (7234,  'Jordan Ayew',          'Centre-Forward',    'Ghana',     team_id),
  (9345,  'Sam Johnstone',        'Goalkeeper',        'England',   team_id);
END $$;

-- ============================================================
-- EVERTON FC
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'Everton FC';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (7890,  'Jordan Pickford',      'Goalkeeper',        'England',   team_id),
  (9001,  'Dominic Calvert-Lewin','Centre-Forward',    'England',   team_id),
  (8112,  'Jarrad Branthwaite',   'Centre-Back',       'England',   team_id),
  (7223,  'Vitalii Mykolenko',    'Left-Back',         'Ukraine',   team_id),
  (9334,  'Seamus Coleman',       'Right-Back',        'Ireland',   team_id),
  (8445,  'Abdoulaye Doucoure',   'Central Midfield',  'France',    team_id),
  (7556,  'Idrissa Gueye',        'Defensive Midfield','Senegal',   team_id),
  (9667,  'Jack Harrison',        'Left Winger',       'England',   team_id),
  (8778,  'Dwight McNeil',        'Left Winger',       'England',   team_id),
  (7889,  'Beto',                 'Centre-Forward',    'Portugal',  team_id),
  (9990,  'Ashley Young',         'Right-Back',        'England',   team_id),
  (8101,  'James Garner',         'Central Midfield',  'England',   team_id),
  (7212,  'Arnaut Danjuma',       'Left Winger',       'Netherlands',team_id),
  (9323,  'Ben Godfrey',          'Centre-Back',       'England',   team_id),
  (8434,  'Michael Keane',        'Centre-Back',       'England',   team_id);
END $$;

-- ============================================================
-- FULHAM FC
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'Fulham FC';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (7545,  'Bernd Leno',           'Goalkeeper',        'Germany',   team_id),
  (9656,  'Aleksandar Mitrovic',  'Centre-Forward',    'Serbia',    team_id),
  (8767,  'Andreas Pereira',      'Attacking Midfield','Brazil',    team_id),
  (7878,  'Willian',              'Right Winger',      'Brazil',    team_id),
  (9989,  'Tom Cairney',          'Central Midfield',  'Scotland',  team_id),
  (8090,  'Joao Palhinha',        'Defensive Midfield','Portugal',  team_id),
  (7101,  'Tim Ream',             'Centre-Back',       'USA',       team_id),
  (9212,  'Tosin Adarabioyo',     'Centre-Back',       'England',   team_id),
  (8323,  'Kenny Tete',           'Right-Back',        'Netherlands',team_id),
  (7434,  'Antonee Robinson',     'Left-Back',         'USA',       team_id),
  (9545,  'Bobby Decordova-Reid', 'Right Winger',      'Jamaica',   team_id),
  (8656,  'Harry Wilson',         'Right Winger',      'Wales',     team_id),
  (7767,  'Manor Solomon',        'Left Winger',       'Israel',    team_id),
  (9878,  'Alex Iwobi',           'Attacking Midfield','Nigeria',   team_id),
  (8989,  'Raul Jimenez',         'Centre-Forward',    'Mexico',    team_id);
END $$;

-- ============================================================
-- HULL CITY AFC
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'Hull City AFC';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (7100,  'Ivor Pandur',          'Goalkeeper',        'Croatia',   team_id),
  (9211,  'Liam Delap',           'Centre-Forward',    'England',   team_id),
  (8322,  'Jaden Philogene',      'Right Winger',      'England',   team_id),
  (7433,  'Ozan Tufan',           'Central Midfield',  'Turkey',    team_id),
  (9544,  'Adama Traore',         'Right Winger',      'Spain',     team_id),
  (8655,  'Jacob Greaves',        'Centre-Back',       'England',   team_id),
  (7766,  'Sean McLoughlin',      'Centre-Back',       'Ireland',   team_id),
  (9877,  'Lewie Coyle',          'Right-Back',        'England',   team_id),
  (8988,  'Regan Slater',         'Central Midfield',  'England',   team_id),
  (7099,  'Dogukan Sinik',        'Left Winger',       'Turkey',    team_id),
  (9210,  'Ryan Longman',         'Left Winger',       'England',   team_id),
  (8321,  'Oscar Estupinan',      'Centre-Forward',    'Ecuador',   team_id),
  (7432,  'Jean Michael Seri',    'Central Midfield',  'Ivory Coast',team_id),
  (9543,  'Cyrus Christie',       'Right-Back',        'Ireland',   team_id),
  (8654,  'Callum Elder',         'Left-Back',         'Australia', team_id);
END $$;

-- ============================================================
-- IPSWICH TOWN FC
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'Ipswich Town FC';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (7765,  'Christian Walton',     'Goalkeeper',        'England',   team_id),
  (9876,  'Liam Delap',           'Centre-Forward',    'England',   team_id),
  (8987,  'Omari Hutchinson',     'Right Winger',      'England',   team_id),
  (7098,  'Conor Chaplin',        'Attacking Midfield','England',   team_id),
  (9209,  'Sam Morsy',            'Central Midfield',  'Egypt',     team_id),
  (8320,  'Luke Woolfenden',      'Centre-Back',       'England',   team_id),
  (7431,  'Cameron Burgess',      'Centre-Back',       'Australia', team_id),
  (9542,  'Leif Davis',           'Left-Back',         'England',   team_id),
  (8653,  'Nathan Broadhead',     'Left Winger',       'Wales',     team_id),
  (7764,  'Massimo Luongo',       'Central Midfield',  'Australia', team_id),
  (9875,  'Wes Burns',            'Right-Back',        'Wales',     team_id),
  (8986,  'George Hirst',         'Centre-Forward',    'England',   team_id),
  (7097,  'Freddie Ladapo',       'Centre-Forward',    'England',   team_id),
  (9208,  'Ali Al-Hamadi',        'Centre-Forward',    'Iraq',      team_id),
  (8319,  'Axel Tuanzebe',        'Centre-Back',       'DR Congo',  team_id);
END $$;

-- ============================================================
-- LEEDS UNITED FC
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'Leeds United FC';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (7430,  'Illan Meslier',        'Goalkeeper',        'France',    team_id),
  (9541,  'Patrick Bamford',      'Centre-Forward',    'England',   team_id),
  (8652,  'Crysencio Summerville','Left Winger',       'Netherlands',team_id),
  (7763,  'Wilfried Gnonto',      'Left Winger',       'Italy',     team_id),
  (9874,  'Marc Roca',            'Central Midfield',  'Spain',     team_id),
  (8985,  'Liam Cooper',          'Centre-Back',       'Scotland',  team_id),
  (7096,  'Robin Koch',           'Centre-Back',       'Germany',   team_id),
  (9207,  'Luke Ayling',          'Right-Back',        'England',   team_id),
  (8318,  'Junior Firpo',         'Left-Back',         'Dominican Republic',team_id),
  (7429,  'Brenden Aaronson',     'Attacking Midfield','USA',       team_id),
  (9540,  'Willy Gnonto',         'Right Winger',      'Italy',     team_id),
  (8651,  'Tyler Adams',          'Defensive Midfield','USA',       team_id),
  (7762,  'Georginio Rutter',     'Centre-Forward',    'France',    team_id),
  (9873,  'Max Wober',            'Centre-Back',       'Austria',   team_id),
  (8984,  'Joel Robles',          'Goalkeeper',        'Spain',     team_id);
END $$;

-- ============================================================
-- LIVERPOOL FC
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'Liverpool FC';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (3630,  'Alisson Becker',       'Goalkeeper',        'Brazil',    team_id),
  (44,    'Mohamed Salah',         'Right Winger',      'Egypt',     team_id),
  (8562,  'Darwin Nunez',          'Centre-Forward',    'Uruguay',   team_id),
  (7341,  'Luis Diaz',             'Left Winger',       'Colombia',  team_id),
  (9123,  'Dominik Szoboszlai',    'Attacking Midfield','Hungary',   team_id),
  (6289,  'Virgil van Dijk',       'Centre-Back',       'Netherlands',team_id),
  (8934,  'Trent Alexander-Arnold','Right-Back',        'England',   team_id),
  (7821,  'Andrew Robertson',      'Left-Back',         'Scotland',  team_id),
  (9456,  'Ryan Gravenberch',      'Central Midfield',  'Netherlands',team_id),
  (8103,  'Alexis Mac Allister',   'Central Midfield',  'Argentina', team_id),
  (7654,  'Cody Gakpo',            'Left Winger',       'Netherlands',team_id),
  (9287,  'Curtis Jones',          'Central Midfield',  'England',   team_id),
  (8432,  'Ibrahima Konate',       'Centre-Back',       'France',    team_id),
  (7109,  'Joe Gomez',             'Centre-Back',       'England',   team_id),
  (9876,  'Harvey Elliott',        'Attacking Midfield','England',   team_id);
END $$;

-- ============================================================
-- MANCHESTER CITY FC
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'Manchester City FC';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (3831,  'Ederson',              'Goalkeeper',        'Brazil',    team_id),
  (7868,  'Erling Haaland',       'Centre-Forward',    'Norway',    team_id),
  (7491,  'Kevin De Bruyne',      'Attacking Midfield','Belgium',   team_id),
  (8234,  'Phil Foden',           'Attacking Midfield','England',   team_id),
  (9345,  'Bernardo Silva',       'Right Winger',      'Portugal',  team_id),
  (6543,  'Ruben Dias',           'Centre-Back',       'Portugal',  team_id),
  (7654,  'Manuel Akanji',        'Centre-Back',       'Switzerland',team_id),
  (8765,  'Kyle Walker',          'Right-Back',        'England',   team_id),
  (9876,  'Josko Gvardiol',       'Left-Back',         'Croatia',   team_id),
  (7987,  'Rodri',                'Defensive Midfield','Spain',     team_id),
  (9098,  'Jack Grealish',        'Left Winger',       'England',   team_id),
  (8109,  'Jeremy Doku',          'Left Winger',       'Belgium',   team_id),
  (7210,  'Matheus Nunes',        'Central Midfield',  'Portugal',  team_id),
  (9321,  'Rico Lewis',           'Right-Back',        'England',   team_id),
  (8432,  'Stefan Ortega',        'Goalkeeper',        'Germany',   team_id);
END $$;

-- ============================================================
-- MANCHESTER UNITED FC
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'Manchester United FC';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (8109,  'Andre Onana',          'Goalkeeper',        'Cameroon',  team_id),
  (7654,  'Marcus Rashford',      'Left Winger',       'England',   team_id),
  (9321,  'Bruno Fernandes',      'Attacking Midfield','Portugal',  team_id),
  (8432,  'Rasmus Hojlund',       'Centre-Forward',    'Denmark',   team_id),
  (7543,  'Kobbie Mainoo',        'Central Midfield',  'England',   team_id),
  (9654,  'Casemiro',             'Defensive Midfield','Brazil',    team_id),
  (8765,  'Lisandro Martinez',    'Centre-Back',       'Argentina', team_id),
  (7876,  'Raphael Varane',       'Centre-Back',       'France',    team_id),
  (9987,  'Aaron Wan-Bissaka',    'Right-Back',        'England',   team_id),
  (8098,  'Luke Shaw',            'Left-Back',         'England',   team_id),
  (7209,  'Antony',               'Right Winger',      'Brazil',    team_id),
  (9320,  'Alejandro Garnacho',   'Left Winger',       'Argentina', team_id),
  (8431,  'Scott McTominay',      'Central Midfield',  'Scotland',  team_id),
  (7542,  'Harry Maguire',        'Centre-Back',       'England',   team_id),
  (9653,  'Tom Heaton',           'Goalkeeper',        'England',   team_id);
END $$;

-- ============================================================
-- NEWCASTLE UNITED FC
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'Newcastle United FC';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (8764,  'Nick Pope',            'Goalkeeper',        'England',   team_id),
  (7875,  'Alexander Isak',       'Centre-Forward',    'Sweden',    team_id),
  (9986,  'Anthony Gordon',       'Left Winger',       'England',   team_id),
  (8097,  'Bruno Guimaraes',      'Central Midfield',  'Brazil',    team_id),
  (7208,  'Joelinton',            'Central Midfield',  'Brazil',    team_id),
  (9319,  'Kieran Trippier',      'Right-Back',        'England',   team_id),
  (8430,  'Sven Botman',          'Centre-Back',       'Netherlands',team_id),
  (7541,  'Dan Burn',             'Centre-Back',       'England',   team_id),
  (9652,  'Matt Targett',         'Left-Back',         'England',   team_id),
  (8763,  'Fabian Schar',         'Centre-Back',       'Switzerland',team_id),
  (7874,  'Miguel Almiron',       'Right Winger',      'Paraguay',  team_id),
  (9985,  'Harvey Barnes',        'Left Winger',       'England',   team_id),
  (8096,  'Jacob Murphy',         'Right Winger',      'England',   team_id),
  (7207,  'Sean Longstaff',       'Central Midfield',  'England',   team_id),
  (9318,  'Martin Dubravka',      'Goalkeeper',        'Slovakia',  team_id);
END $$;

-- ============================================================
-- NOTTINGHAM FOREST FC
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'Nottingham Forest FC';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (8429,  'Matz Sels',            'Goalkeeper',        'Belgium',   team_id),
  (7540,  'Taiwo Awoniyi',        'Centre-Forward',    'Nigeria',   team_id),
  (9651,  'Morgan Gibbs-White',   'Attacking Midfield','England',   team_id),
  (8762,  'Anthony Elanga',       'Right Winger',      'Sweden',    team_id),
  (7873,  'Callum Hudson-Odoi',   'Left Winger',       'England',   team_id),
  (9984,  'Murillo',              'Centre-Back',       'Brazil',    team_id),
  (8095,  'Joe Worrall',          'Centre-Back',       'England',   team_id),
  (7206,  'Nuno Tavares',         'Left-Back',         'Portugal',  team_id),
  (9317,  'Ola Aina',             'Right-Back',        'Nigeria',   team_id),
  (8428,  'Danilo',               'Defensive Midfield','Brazil',    team_id),
  (7539,  'Ryan Yates',           'Central Midfield',  'England',   team_id),
  (9650,  'Nikola Milenkovic',    'Centre-Back',       'Serbia',    team_id),
  (8761,  'Divock Origi',         'Centre-Forward',    'Belgium',   team_id),
  (7872,  'Ibrahim Sangare',      'Defensive Midfield','Ivory Coast',team_id),
  (9983,  'Matt Turner',          'Goalkeeper',        'USA',       team_id);
END $$;

-- ============================================================
-- SUNDERLAND AFC
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'Sunderland AFC';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (8094,  'Anthony Patterson',    'Goalkeeper',        'England',   team_id),
  (7205,  'Ross Stewart',         'Centre-Forward',    'Scotland',  team_id),
  (9316,  'Jack Clarke',          'Left Winger',       'England',   team_id),
  (8427,  'Patrick Roberts',      'Right Winger',      'England',   team_id),
  (7538,  'Dan Neil',             'Central Midfield',  'England',   team_id),
  (9649,  'Aji Alese',            'Centre-Back',       'England',   team_id),
  (8760,  'Danny Batth',          'Centre-Back',       'England',   team_id),
  (7871,  'Lynden Gooch',         'Right-Back',        'USA',       team_id),
  (9982,  'Dennis Cirkin',        'Left-Back',         'England',   team_id),
  (8093,  'Corry Evans',          'Central Midfield',  'Northern Ireland',team_id),
  (7204,  'Amad Diallo',          'Right Winger',      'Ivory Coast',team_id),
  (9315,  'Luke ONeill',          'Right-Back',        'England',   team_id),
  (8426,  'Ellis Simms',          'Centre-Forward',    'England',   team_id),
  (7537,  'Niall Huggins',        'Right-Back',        'Wales',     team_id),
  (9648,  'Pierre Ekwah',         'Central Midfield',  'France',    team_id);
END $$;

-- ============================================================
-- TOTTENHAM HOTSPUR FC
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'Tottenham Hotspur FC';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (8759,  'Guglielmo Vicario',    'Goalkeeper',        'Italy',     team_id),
  (7870,  'Son Heung-min',        'Left Winger',       'South Korea',team_id),
  (9981,  'James Maddison',       'Attacking Midfield','England',   team_id),
  (8092,  'Dejan Kulusevski',     'Right Winger',      'Sweden',    team_id),
  (7203,  'Richarlison',          'Centre-Forward',    'Brazil',    team_id),
  (9314,  'Cristian Romero',      'Centre-Back',       'Argentina', team_id),
  (8425,  'Micky van de Ven',     'Centre-Back',       'Netherlands',team_id),
  (7536,  'Pedro Porro',          'Right-Back',        'Spain',     team_id),
  (9647,  'Destiny Udogie',       'Left-Back',         'Italy',     team_id),
  (8758,  'Yves Bissouma',        'Defensive Midfield','Mali',      team_id),
  (7869,  'Rodrigo Bentancur',    'Central Midfield',  'Uruguay',   team_id),
  (9980,  'Brennan Johnson',      'Right Winger',      'Wales',     team_id),
  (8091,  'Manor Solomon',        'Left Winger',       'Israel',    team_id),
  (7202,  'Oliver Skipp',         'Central Midfield',  'England',   team_id),
  (9313,  'Fraser Forster',       'Goalkeeper',        'England',   team_id);
END $$;

-- ============================================================
-- COVENTRY CITY FC
-- ============================================================
DO $$
DECLARE team_id BIGINT;
BEGIN
  SELECT id INTO team_id FROM teams WHERE name = 'Coventry City FC';
  INSERT INTO players (external_id, name, position, nationality, team_id) VALUES
  (8424,  'Ben Wilson',           'Goalkeeper',        'England',   team_id),
  (7535,  'Viktor Gyokeres',      'Centre-Forward',    'Sweden',    team_id),
  (9646,  'Callum OHare',         'Attacking Midfield','England',   team_id),
  (8757,  'Gustavo Hamer',        'Central Midfield',  'Brazil',    team_id),
  (7868,  'Liam Kelly',           'Defensive Midfield','Scotland',  team_id),
  (9979,  'Jonathan Panzo',       'Centre-Back',       'France',    team_id),
  (8090,  'Kyle McFadzean',       'Centre-Back',       'Scotland',  team_id),
  (7201,  'Fankaty Dabo',         'Right-Back',        'England',   team_id),
  (9312,  'Jake Bidwell',         'Left-Back',         'England',   team_id),
  (8423,  'Matty Godden',         'Centre-Forward',    'England',   team_id),
  (7534,  'Kasey Palmer',         'Attacking Midfield','England',   team_id),
  (9645,  'Joel Latibeaudiere',   'Centre-Back',       'England',   team_id),
  (8756,  'Simon Moore',          'Goalkeeper',        'England',   team_id),
  (7867,  'Haji Wright',          'Centre-Forward',    'USA',       team_id),
  (9978,  'Milan van Ewijk',      'Right-Back',        'Netherlands',team_id);
END $$;

-- Confirm counts
SELECT t.name, COUNT(p.id) as player_count
FROM teams t
LEFT JOIN players p ON p.team_id = t.id
GROUP BY t.name
ORDER BY t.name;
