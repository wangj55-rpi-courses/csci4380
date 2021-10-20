--q1
create table points (
	baker varchar(100)
	, pointvalue int
	, primary key (baker, pointvalue)
);

--q2
insert into points (baker, pointvalue)
select
	b.baker
	, 0 as pointvalue
from 
	bakers b
;

--q3
delete from points
where
	lower(baker) like 'j%'
;

--q4
delete from points
where baker in
	(select
		b.baker
	from
		bakers b
	 	, results r
	where
		b.baker = r.baker
		and episodeid between 1 and 5
		and result like 'eliminated'
	)


--q5
update points
set
	pointvalue = 
	(select
		count(*)
	from
		results r
	where
		points.baker = r.baker
		and r.result like 'star baker'
	)
	+
	(select
		count(*)
	from
		technicals t
	where
		points.baker = t.baker
		and t.rank = 1
	)
where
	baker not like 'D%'
;


