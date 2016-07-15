-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- Drop and re-create database and tables
DROP DATABASE tournament;
CREATE DATABASE tournament;
\c tournament;

-- Players Table
CREATE TABLE Player (
    PlayerID serial PRIMARY KEY,
    Name text
);


-- Match Table
CREATE TABLE Match (
    MatchID serial,
    PlayerIDWinner integer REFERENCES Player(PlayerID),
    PlayerIDLoser integer REFERENCES Player(PlayerID)
);


-- View to count total losses grouped by player
CREATE VIEW MatchLosses AS
SELECT
Player.PlayerID,
COUNT(Match.PlayerIDLoser) as Losses
FROM Player LEFT JOIN Match ON Player.PlayerID = Match.PlayerIDLoser
GROUP BY Player.PlayerID;


-- View to count total wins grouped by player
CREATE VIEW MatchWins AS
SELECT
Player.PlayerID,
COUNT(Match.PlayerIDWinner) as Wins
FROM Player LEFT JOIN Match ON Player.PlayerID = Match.PlayerIDWinner
GROUP BY Player.PlayerID;


-- View to count total matches played
CREATE VIEW MatchesPlayed AS
SELECT
MatchWins.PlayerID,
MatchWins.Wins + MatchLosses.Losses AS Matches
FROM MatchWins, MatchLosses
WHERE MatchWins.PlayerID = MatchLosses.PlayerID;


-- View to get players and their win records, sorted by wins
CREATE VIEW TournamentStandings AS
SELECT
MatchWins.PlayerID as ID,
Player.Name,
MatchWins.Wins,
MatchesPlayed.Matches
FROM MatchWins
JOIN Player ON Player.PlayerID = MatchWins.PlayerID
JOIN MatchesPlayed ON MatchesPlayed.PlayerID = MatchWins.PlayerID
ORDER BY MatchWins.Wins desc;