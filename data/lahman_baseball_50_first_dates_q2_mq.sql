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