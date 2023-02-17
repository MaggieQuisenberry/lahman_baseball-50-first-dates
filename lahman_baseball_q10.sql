WITH player_list AS (SELECT DISTINCT playerid,
COUNT(yearid) AS years_active,
MIN(yearid) AS first_year,
MAX(yearid) AS last_year
FROM batting
GROUP BY playerid
HAVING MAX(yearid) = '2016' AND count(yearid) >= 10),
yr_hr AS ((SELECT DISTINCT playerid, yearid, SUM(hr::numeric) AS hr
FROM batting INNER JOIN player_list USING (playerid)
WHERE hr > 0
GROUP BY playerid, yearid)
UNION
(SELECT DISTINCT playerid, yearid, SUM(hr::numeric) AS hr
FROM battingpost INNER JOIN player_list USING (playerid)
WHERE hr > 0
GROUP BY playerid, yearid)),
max_hr AS (SELECT playerid, MAX(hr) AS max_hr_year
FROM yr_hr
GROUP BY playerid)
SELECT y.playerid, y.yearid, y.hr, m.max_hr_year
FROM yr_hr AS y INNER JOIN max_hr AS m USING (playerid)
WHERE (y.hr = m.max_hr_year) AND y.yearid = '2016'
GROUP BY y.playerid, y.yearid, y.hr, m.max_hr_year;