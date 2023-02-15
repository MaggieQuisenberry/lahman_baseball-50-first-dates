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

SELECT *
FROM appearances



