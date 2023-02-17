--Using the attendance figures from the homegames table, find the teams and parks which had the top 5 average attendance per game in --2016 (where average attendance is defined as total attendance divided by number of games). Only consider parks where there were at --least 10 games played. Report the park name, team name, and average attendance. Repeat for the lowest 5 average attendance.


WITH top_5 AS
(SELECT team, park, attendance/games AS avg_attendance
FROM homegames
WHERE year = '2016'
AND games > 9
ORDER by avg_attendance DESC
LIMIT 5)

SELECT DISTINCT(teams.name),
		teams.park,
		top_5.avg_attendance
FROM top_5 INNER JOIN teams
ON teams.teamid = top_5.team
WHERE teams.yearid = 2016
ORDER BY top_5.avg_attendance DESC


WITH bottom_5 AS
(SELECT team, park, attendance/games AS avg_attendance
FROM homegames
WHERE year = '2016'
AND games > 9
ORDER by avg_attendance 
LIMIT 5)

SELECT DISTINCT(teams.name),
		teams.park,
		bottom_5.avg_attendance
FROM bottom_5 INNER JOIN teams
ON teams.teamid = bottom_5.team
WHERE teams.yearid = 2016
ORDER BY bottom_5.avg_attendance 




