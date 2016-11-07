-- Вывод минимального, среднего и максимального значения времени треков
-- CAST() преобразует строку "00:00" в тип TIME
CREATE OR ALTER VIEW t5 ("MIN", "AVG", "MAX") AS
SELECT MIN(DURATION),
    CAST('00:00' AS TIME) + AVG(DATEDIFF(SECOND FROM TIME '00:00' TO DURATION)),
    MAX(DURATION) FROM TRACKS;
-- Завершение транзакции
COMMIT;