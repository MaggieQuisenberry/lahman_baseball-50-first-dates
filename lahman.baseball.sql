--1. What range of years for baseball games played does the provided database cover? 
SELECT MAX(yearid), MIN (yearid)
FROM teams
--answer 1871- 2016

--2. Find the name and height of the shortest player in the database. How many games did he play in? What is the name of the team 
--for which he played?
SELECT namefirst, nameLast, MIN(height), G_all, teamID, name
FROM people
INNER JOIN appearances
INNER JOIN teams
USING(teamID)
USING (playerID)
GROUP by namefirst, namelast, G_all, teamID, name
ORDER BY MIN(height)
LIMIT 1;

-- answer Eddie Gaedel, played 1 game, Height- 43, team- St. Louis Browns


--3. Find all players in the database who played at Vanderbilt University. Create a list showing each
--player’s first and last names --as well as the total salary they earned in the major leagues. Sort
--this list in descending order by the total salary earned. Which --Vanderbilt player earned the most 
--money in the majors?

SELECT playerid
FROM collegeplaying
WHERE schoolid = '%vanderbilt%''

SELECT *
FROM collegeplaying

--4. Using the fielding table, group players into three groups based on their position: label players
--with position OF as "Outfield", those with position "SS", "1B", "2B", and "3B" as "Infield", and 
--those with position "P" or "C" as "Battery". Determine the number of putouts made by each of these 
--three groups in 2016.

SELECT playerID,
	CASE WHEN G_of > 0 THEN 'outfield' 
	     WHEN G_ss > 0 OR G_1b >0  OR G_2b > 0 OR G_3b > 0 THEN 'infield'  
		 WHEN G_p >0 OR G_c > 0 THEN 'battery' ELSE 'no position' END AS position
FROM fielding
INNER JOIN appearances
USING (playerID)

SELECT COUNT(playerid) AS num_players, SUM(po) AS num_putouts,
	   CASE WHEN pos = 'OF' THEN 'Outfield'
	   		WHEN pos = 'SS' OR pos = '1B' OR pos = '2B' OR pos = '3B' THEN 'Infield'
			WHEN pos = 'P' OR pos = 'C' THEN 'Battery'
	   		ELSE 'missing' END AS player_group
FROM fielding
WHERE yearid = '2016'
GROUP BY player_group;

--7.  From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? What is the smallest
--number of wins for a team that did win the world series? Doing this will probably result in an unusually small number of wins
--for a world series champion – determine why this is the case. Then redo your query, excluding the problem year. How often from 
--1970 – 2016 was it the case that a team with the most wins also won the world series? What percentage of the time?

(SELECT yearID, name, MAX(W) AS most_wins, MIN(W) AS least_wins, L, WSWIN
FROM teams
WHERE yearid >= 1970 AND yearid <= 2016
AND WSWin = 'N'
GROUP by yearID, name, W, L, WSWIN
ORDER BY most_wins DESC, least_wins
LIMIT 1)
UNION
(SELECT yearID, name, MAX(W) AS most_wins, MIN(W) AS least_wins, L, WSWIN
FROM teams
WHERE yearid >= 1970 AND yearid <= 2016
AND WSWin = 'Y'
GROUP by yearID, name, W, L, WSWIN
ORDER BY most_wins, least_wins 
LIMIT 1)

--There was a players strike in the year of 1981 which leds to the dodgers have an abnormally low number of wins when going to the --world series

SELECT yearID, name, MAX(W) AS most_wins, L, WSWIN
FROM teams
WHERE yearid >= 1970 AND yearid <= 2016 AND yearid <> 1981
AND wswin = 'Y'
GROUP by yearID, name, W, L, WSWIN
ORDER BY yearid

