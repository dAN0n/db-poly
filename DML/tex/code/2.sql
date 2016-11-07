-- Вывод альбомов, начинающихся с "J-N"
CREATE OR ALTER VIEW t2_1 AS
SELECT * FROM ALBUMS WHERE ALBUM LIKE 'J-N%';
-- Вывод альбомов, выпущенных в период 2007-2009 годов
CREATE OR ALTER VIEW t2_2 AS
SELECT * FROM ALBUMS WHERE "YEAR" BETWEEN 2007 AND 2009;
-- Вывод альбомов, в которых 50, 100, 150 проголосовавших для рейтинга
CREATE OR ALTER VIEW t2_3 AS
SELECT * FROM ALBUMS WHERE NUM_OF_RATINGS IN (50,100,150);
-- Завершение транзакции
COMMIT;