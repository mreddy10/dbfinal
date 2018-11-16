
/* Query 3.a.ii */
SELECT Artists, AVG(R.rank) AS AVG_RANKING
FROM SONGS AS S
    INNER JOIN RANKING AS R ON S.songid = R.songid
GROUP BY ARTIST;

/* Query 3.b.iii */

SELECT ChangeInRating
FROM (SELECT AVG(rating) AS AvgRating
    FROM Album AS A
        INNER JOIN Review AS R 
    WHERE A.albumid = R.albumid
        AND A.genre = 'pop'
        AND A.year = 1980) AS A,
    (SELECT AVG(rating) AS AvgRating
    FROM Album AS A
        INNER JOIN Review AS R 
    WHERE A.albumid = R.albumid
        AND A.genre = 'pop'
        AND A.year = 2015) AS B
WHERE ChangeInRating = A - B;

/* Query 3.b.iv */
SELECT reviewer, avgrating
FROM (SELECT reviewer, AVG(rating) AS avgrating
    FROM Review
    GROUP BY reviewer);
    
/* Query 3.c.i */
SELECT COUNT(*) AS NumSongs
FROM Songs AS S
INNER JOIN Ranking AS R ON S.songid = R.songid
INNER JOIN AlbumSongs AS AlSongs ON s.songid = Alsongs.songid
INNER JOIN Review AS Rv ON Alsongs.albumid = Rv.albumid
WHERE R.rank > 50
AND Rv.rating > 7;
