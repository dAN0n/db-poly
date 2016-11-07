-- Вывести названия треков из альбомов с названиями, 
-- начинающимися с "J-N"
CREATE OR ALTER VIEW t8 AS
SELECT TRACK_ID, TITLE FROM TRACKS WHERE TRACK_ID IN
    (SELECT TRACK_ID FROM TRACKLISTS WHERE ALB_ID IN
        (SELECT ALB_ID FROM ALBUMS WHERE ALBUM LIKE 'J-N%'));
-- Завершение транзакции
COMMIT;