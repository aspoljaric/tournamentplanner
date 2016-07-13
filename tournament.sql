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
DROP TABLE IF EXISTS Match;
DROP TABLE IF EXISTS Player;

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
