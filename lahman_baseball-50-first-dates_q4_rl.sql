-- 4. Using the fielding table, group players into three groups based on their position: label players with position OF as "Outfield", those with position "SS", "1B", "2B", and "3B" as "Infield", and those with position "P" or "C" as "Battery". Determine the number of putouts made by each of these three groups in 2016.

SELECT COUNT(playerid) AS num_players, SUM(po) AS num_putouts,
	   CASE WHEN pos = 'OF' THEN 'Outfield'
	   		WHEN pos = 'SS' OR pos = '1B' OR pos = '2B' OR pos = '3B' THEN 'Infield'
			WHEN pos = 'P' OR pos = 'C' THEN 'Battery'
	   		ELSE 'missing' END AS player_group
FROM fielding
WHERE yearid = '2016'
GROUP BY player_group;