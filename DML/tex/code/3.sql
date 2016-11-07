-- Вычисляется дополнительное поле длительности песни в NightCore жанре
-- (ускорение на 30%)
-- С помощью DATEDIFF() получаем количество секунд, 
-- выполняем умножение и вычитаем из начальной длины
CREATE OR ALTER VIEW t3 AS
SELECT TITLE, DURATION, 
    (DURATION - (DATEDIFF(SECOND FROM TIME '00:00' TO DURATION)*0.3)) AS NIGHTCORE_DURATION
	FROM TRACKS;
-- Завершение транзакции
COMMIT;