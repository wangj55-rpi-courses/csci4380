--q1
SELECT a.name
FROM artists a
   , songs s
   , spotify sp
WHERE a.id = s.artistid
  and s.id = sp.songid
  and sp.streams >= 10000000
GROUP BY a.name
ORDER BY a.name asc
;

--q2
SELECT a.name
FROM artists a
   , songs s
   , bilboard b
   , rollingstonetop500 r
WHERE a.id = s.artistid
  and s.id = b.songid
  and b.rank = 1
  and a.id = r.artistid
  and r.position <= 50
GROUP BY a.name
ORDER BY a.name asc
;

--q3
SELECT s.id   as songid
     , s.name as songname
     , a.name as artistname
FROM artists a
   , songs s
   , bilboard b
WHERE a.id = s.artistid
  and s.id = b.songid
  and b.chartdate between '2020-08-01' and '2020-08-31'
  and b.weeksonboard >= 25
GROUP BY s.id, s.name, a.name
UNION
SELECT s.id   as songid
     , s.name as songname
     , a.name as artistname
FROM artists a
   , songs s
   , spotify sp
WHERE a.id = s.artistid
  and s.id = sp.songid
  and sp.streamdate between '2020-08-01' and '2020-08-31'
  and sp.streams >= 5000000
GROUP BY s.id, s.name, a.name
ORDER BY songname asc, artistname asc
;

--q4
SELECT s.id   as songid
     , s.name as songname
     , a.name as artistname
FROM artists a
   , songs s
   , playedonradio pr
WHERE a.id = s.artistid
  and s.id = pr.songid
  and pr.playedtime::time between '08:00:00' and '10:00:00'
GROUP BY
    s.id, s.name, a.name
    EXCEPT
SELECT s.id   as songid
     , s.name as songname
     , a.name as artistname
FROM artists a
   , songs s
   , playedonradio pr
WHERE a.id = s.artistid
  and s.id = pr.songid
  and (pr.playedtime::time < '08:00:00' or pr.playedtime::time > '10:00:00')
GROUP BY s.id, s.name, a.name
ORDER BY songname asc
       , artistname asc
;

--q5
SELECT s.id   as songid
     , s.name as songname
     , a.name as artistname
FROM artists a
   , songs s
   , playedonradio pr
   , spotify sp
WHERE a.id = s.artistid
  and s.id = pr.songid
  and s.id = sp.songid
  and sp.streams >= 4000000
GROUP BY s.id, s.name, a.name
    EXCEPT

SELECT s.id   as songid
     , s.name as songname
     , a.name as artistname
FROM artists a
   , songs s
   , bilboard b
WHERE a.id = s.artistid
  and s.id = b.songid
GROUP BY s.id, s.name, a.name

ORDER BY songname asc
       , artistname asc
;

--q6
SELECT a.id
     , a.name
     , count(distinct s.id) as songsonbilboard
     , min(b.rank)          as minbilboardrank
FROM artists a
   , songs s
   , bilboard b
   , rollingstonetop500 r
WHERE a.id = s.artistid
  and s.id = b.songid
  and a.id = r.artistid
  and r.position <= 25
GROUP BY a.id, a.name
ORDER BY a.name asc
;

--q7
SELECT a.id
     , a.name
FROM artists a
   , songs s
   , rollingstonetop500 r
   , playedonradio pr
WHERE a.id = r.artistid
  and a.id = s.artistid
  and s.id = pr.songid
  and pr.playedtime::date between '2020-03-01' and '2020-03-31'
GROUP BY
    a.id, a.name
HAVING
    count (distinct pr.id) >= 2
   and count (*) >= 20
ORDER BY
    a.id asc
;

--q8
SELECT sg.genre
FROM song_genre sg
   , songs s
   , bilboard b
WHERE sg.songid = s.id
  and b.songid = s.id
  and b.rank > 5
GROUP BY sg.genre
HAVING count(distinct s.id) >= 4
    EXCEPT
SELECT sg.genre
FROM song_genre sg
   , songs s
   , bilboard b
WHERE sg.songid = s.id
  and b.songid = s.id
  and b.rank <= 5
GROUP BY sg.genre
ORDER BY genre asc
;
