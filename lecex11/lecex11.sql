-- q1
SELECT
	fullname
FROM
	bakers b
	, signatures s
WHERE
	b.baker = s.baker
	and lower(s.make) like '%madeleines%'
ORDER BY
	fullname asc
;

-- q2
SELECT
	fullname
FROM
	bakers b
EXCEPT
SELECT
	fullname
FROM
	bakers b
	, signatures s
WHERE
	b.baker = s.baker
	and lower(s.make) like '%ginger%'
;

-- q3
SELECT
    max(e.viewers7day) as maxviewers
FROM
    episodes e
;

-- q4
SELECT
    max(abs(e1.viewers7day - e2.viewers7day)) as maxviewerdiff
FROM
    episodes e1
    , episodes e2
WHERE
    e2.id = e1.id+1
;

-- q5
SELECT
    b.baker
    , count(*) as numtimes
FROM
    bakers b
    , showstoppers s
WHERE
    b.baker = s.baker
    and lower(s.make) like '%cake%'
GROUP BY
    b.baker
ORDER BY
    numtimes desc
    , b.baker asc
;