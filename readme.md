Project
-------
Tournament Planner

Description
-----------
The project implements a game tournament which uses the Swiss system for pairing up players in each round. Players are not eliminated, and each player is paired with another player with the same number of wins, or as close as possible.

The software is written in Python and uses a PostgreSQL database.

Installation
------------
Prerequisite - psycopg2 library installed to support PostgreSQL.

Creation of the database and tables (schema) is contained in "tournament.sql".
To run type the following in the command line;

psql \i tournament.sql

The test cases are contained in "tournament_test.py"
To run the cases type the following in the command line;

python tournament_test.py

Author
------
Albert Spoljaric (albert.spoljaric@gmail.com)