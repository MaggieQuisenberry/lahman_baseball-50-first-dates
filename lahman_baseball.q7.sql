--7.  From 1970 – 2016, what is the largest number of wins for a team that did not win the world 
--series? 
--What is the smallest number of wins for a team that did win the world series? Doing this will 
--probably result in an unusually small number of wins for a world series champion – determine why this --is the case. Then redo your query, excluding the problem year. How often from 
--1970 – 2016 was it the case that a team with the most wins also won the world series? What percentage --of the time?


(SELECT yearid, name, w, wswin
FROM teams
WHERE wswin = 'N'
AND yearid > 1969 AND yearid < 2017
GROUP by yearid, name, w, wswin
ORDER by W DESC
LIMIT 1)
UNION
(SELECT yearid, name, w, wswin
FROM teams
WHERE wswin = 'Y'
AND yearid > 1969 AND yearid < 2017
GROUP by yearid, name, w, wswin
ORDER by W 
LIMIT 1);


--part b. There was a players strike in the year of 1981 which leds to the dodgers have an abnormally 
--low number of wins when going to the --world series

--part c Then redo your query, excluding the problem year. How often from 1970 – 2016 was it the case --that a team with the most wins also won the world series? What percentage of the time?

WITH most_yearly_wins AS 
(SELECT yearid, MAX(t.w) AS most_wins
FROM teams AS t
WHERE yearid > 1969 AND yearid <> 1981
GROUP by yearid
ORDER by yearid DESC)

SELECT (COUNT (DISTINCT teams.yearid)* 100)/46 AS percentage
FROM most_yearly_wins
INNER JOIN teams USING (yearid)
WHERE wswin = 'Y' AND w= most_wins















