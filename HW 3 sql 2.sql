SELECT tytle, track_duration FROM track
WHERE track_duration = (SELECT MAX(track_duration) FROM track t);

SELECT tytle, track_duration FROM track
WHERE track_duration >= '3:30:00';

SELECT tytle FROM collection c 
WHERE release_year BETWEEN 2018 AND 2020;

SELECT name FROM singer s
WHERE name NOT LIKE '% %';

SELECT tytle FROM track t 
WHERE tytle LIKE '%My%' OR tytle LIKE '%my%';

SELECT tytle AS "genre", count(genre_id) AS "singer count" FROM genresinger g
LEFT JOIN genre g2 ON g.genre_id =g2.id 
GROUP BY tytle;

SELECT COUNT(t.tytle) FROM track t
LEFT JOIN album a ON  t.album_id =a.id
where release_year BETWEEN 2019 AND 2020;

SELECT a.tytle, AVG(t.track_duration) FROM track t
LEFT JOIN album a ON  t.album_id =a.id
GROUP BY a.tytle;

SELECT name FROM singer s 
LEFT JOIN (
SELECT a2.singer_id, a.release_year FROM albumsinger a2 
LEFT JOIN album a ON  a2.album_id =a.id
) AS r ON r.singer_id=s.id
WHERE r.release_year IS NULL OR r.release_year != 2020;

SELECT c.tytle FROM trackcollection t 
LEFT JOIN collection c ON c.id = t.collection_id 
LEFT JOIN track tr ON tr.id = t.track_id 
LEFT JOIN albumsinger a ON tr.album_id = a.album_id
LEFT JOIN singer s ON s.id = a.singer_id 
WHERE s.name = 'Jennifer Lopez'
GROUP BY c.tytle;
