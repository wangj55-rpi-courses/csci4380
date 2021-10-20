--q1
select
	avg(viewers7day)::numeric(5,2) as avgviewers
from
	episodes ep
;

--q2
select
	ep.id
from
	(select
		avg(viewers7day)::numeric(5,2) as avgviewers
	from
		episodes ep
	) av
	, episodes ep
where
	ep.viewers7day > av.avgviewers
order by
	ep.id asc
;

--q3
select
	b.fullname
	, count(ss.baker) as numtimes
from
	bakers b left join showstoppers ss 
		on b.baker=ss.baker and lower(ss.make) like '%chocolate%'
group by
	b.fullname
order by
	b.fullname asc
	, numtimes asc
;

--q4
select
	b.baker
	, count(t.baker) as numtimes
from
	bakers b
		left join technicals t
		on b.baker = t.baker
			and t.rank = 1
group by
	b.baker
order by
	b.baker asc
	, numtimes asc
;

--q5
select
	count(t.baker) as numtimes
from
	bakers b
		left join technicals t
		on b.baker = t.baker
			and t.rank = 1
group by
	b.baker
order by
	numtimes desc
limit
	2
;




