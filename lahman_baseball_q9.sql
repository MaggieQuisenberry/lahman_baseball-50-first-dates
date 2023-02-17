
9.
9. Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? Give their full name and the teams that they were managing when they won the award.

WITH managers_awards AS
	(SELECT DISTINCT aw1.yearid, aw1.playerid, aw1.awardid, aw1.lgid AS lgid_1, aw2.lgid AS lgid_2
	FROM AwardsManagers AS aw1
	INNER JOIN AwardsManagers AS aw2 USING (playerid)
	WHERE aw1.awardid = 'TSN Manager of the Year'
	AND aw1.lgid <> 'ML'
	AND aw2.lgid <> 'ML'
	AND aw1.lgid <> aw2.lgid)

SELECT namelast, namefirst, ma.playerid, ma.yearid
	FROM managers_awards AS ma
	INNER JOIN people USING (playerid)
	GROUP by namelast, namefirst, ma.playerid, ma.yearid
	
	
WITH managers_awards AS
	(SELECT DISTINCT aw1.yearid, aw1.playerid, aw1.awardid, aw1.lgid AS lgid_1, aw2.lgid AS lgid_2
	FROM AwardsManagers AS aw1
	INNER JOIN AwardsManagers AS aw2 USING (playerid)
	WHERE aw1.awardid = 'TSN Manager of the Year'
	AND aw1.lgid <> 'ML'
	AND aw2.lgid <> 'ML'
	AND aw1.lgid <> aw2.lgid)

SELECT namelast, namefirst, ma.playerid, ma.yearid
	FROM managers_awards AS ma
	INNER JOIN people USING (playerid)
	GROUP by namelast, namefirst, ma.playerid, ma.yearid
		  
	
	
















	
	
	
	
	









							 











