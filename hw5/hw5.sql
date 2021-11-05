--q1
select
	top_a.name as artistname
	, count(distinct bs.id) as numsongs
from
	(select
		a.id
		, a.name
	from 
		artists a
		, rollingstonetop500 r
		, songs s
	where
		a.id = r.artistid
		and r.position <= 20
		and a.id = s.artistid
	) top_a
	left join 
	(select
		s.artistid
		, s.id
	from 
		songs s 
		, bilboard b
	where
		s.id = b.songid
	) bs
	on top_a.id = bs.artistid
group by
	top_a.name
order by
	numsongs desc
	, artistname asc
;

--q2
select
	ds.songname as songname
	, ds.artistname as artistname
	, count(distinct pr.id) as numplayed
from
	(select
		s.name as songname
		, s.id  as songid
		, a.name as artistname
	from
		artists a 
		, songs s 
		, bilboard b
	where 
		s.danceability >= 0.9
		and s.id = b.songid
		and b.rank  <= 10
		and a.id = s.artistid
	) ds
		left join playedonradio pr
			on ds.songid = pr.songid
group by
	songname
	, artistname
order by
	numplayed desc
	, songname asc
	, artistname asc
;

--q3
select
	bs.songname as songname
	, bs.artistname as artistname
	, bs.minrank as minrank
from
	(select
		s.id as songid
		, s.name as songname
		, a.name as artistname
		, min(b.rank) as minrank
	from
		artists a
		, songs s
		, bilboard b
	where
		a.id = s.artistid
		and s.id = b.songid
		and b.weeksonboard >= 25
	group by
		s.id, s.name, a.name
	) bs
		left join playedonradio pr
			on bs.songid = pr.songid
where
	pr.songid is null
group by
	bs.songname
	, bs.artistname
	, bs.minrank
order by
	minrank asc
	, songname asc
	, artistname asc
;

--q4
select
	bs.songname as songname
	, bs.artistname as artistname
	, bs.minrank as minrank
from
	(select
		s.id as songid
		, s.name as songname
		, a.name as artistname
		, min(b.rank) as minrank
	from
		artists a
		, songs s
		, bilboard b
	where
		a.id = s.artistid
		and s.id = b.songid
		and b.weeksonboard >= 25
	group by
		s.id, s.name, a.name
	) bs
where
	not exists
	(select 1
	from playedonradio pr
	where bs.songid = pr.songid
	)
group by
	bs.songname
	, bs.artistname
	, bs.minrank
order by
	minrank asc
	, songname asc
	, artistname asc
;

--q5
select
	s.name as songname
	, a.name as artistname
	, s.decade
	, round(s.duration_ms/(1000*60)) as duration
from
	(select
		min(round(s.duration_ms/(1000*60))) as minduration
	from
		songs s
	) min_d
	, artists a 
	, songs s
where
	a.id = s.artistid
	and round(s.duration_ms/(1000*60)) = min_d.minduration
group by
	s.name, a.name, s.decade, s.duration_ms
order by
	songname asc
	, artistname asc
;

--q6
with totalstreamsong as
	(select
		s.id as songid
		, s.name as songname
		, s.artistid
		, sum(sp.streams) as totalstreams
	from
		songs s
		, spotify sp 
		, artists a
	where
		s.id = sp.songid
		and s.artistid = a.id
	group by
		s.id, s.name, s.artistid
	)
select
	ts.songname as songname
	, a.name as artistname
	, to_char(ts.totalstreams, '999,999,999,999') as totalstreams
from
	(select
		max(ts.totalstreams) as maxtotalstream
	from
		totalstreamsong ts
	) max_s
	, totalstreamsong ts
	, artists a
where
	a.id = ts.artistid
	and ts.totalstreams between max_s.maxtotalstream*0.5 and max_s.maxtotalstream
group by
	ts.songname, a.name, totalstreams
order by
	songname asc
	, artistname asc
;

--q7
with top10songs as
	(select
		s.id
		, s.name
		, s.artistid
		, b.chartdate
	from
		songs s 
		, bilboard b 
	where
		s.id = b.songid
		and b.rank <= 10)
select
	a.name
from
	artists a 
	, rollingstonetop500 r
	, (select
			a.id as artistid
			, min(ts.chartdate) as earliest_date
		from
			top10songs ts
			, artists a
		where
			a.id = ts.artistid
		group by
			a.id
	) earliest_dates
where
	a.id = earliest_dates.artistid
	and a.id = r.artistid
	and earliest_dates.earliest_date >= '2004-01-01'
group by
	a.name
order by
	a.name asc
;

--q8









