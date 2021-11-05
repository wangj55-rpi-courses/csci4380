
DROP FUNCTION IF EXISTS recommendation(fromtime time, totime time, inputstation varchar, topk int, w1 float, w2 float, w3 float) RETURNS SETOF names AS $$
DECLARE
BEGIN

END;
$$
LANGUAGE plpgsql;

DROP TABLE IF EXISTS songsimilarity;

CREATE TABLE songsimilarity
(
    songid     int,
    songname   text,
    artistname text,
    songscore  float
);

CREATE
OR REPLACE FUNCTION
    recommendation(fromtime time
               , totime time
               , inputstation varchar
               , topk int
	       , w1 float, w2 float, w3 float)
    RETURNS SETOF songsimilarity AS $$
DECLARE
myrow songsimilarity%rowtype ;
BEGIN

FOR myrow IN
SELECT s.id   as songid
     , s.name as songname
     , a.name as artistname
     , 0.5    as songscore
FROM songs s,
     artists a
WHERE s.artistid = a.id LIMIT 5
   LOOP
       RETURN NEXT myrow;
END LOOP ;
   
   RETURN ;
END ;
$$
LANGUAGE plpgsql ;

select *
from recommendation(time '08:00', time '10:00', 'mai', 10, 1, 1, 1);
