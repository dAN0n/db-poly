-- Сортировка таблицы ALBUMS по годам по возрастанию
-- и по кол-ву проголосовавших по убыванию
CREATE OR ALTER VIEW t4 AS
SELECT * FROM ALBUMS ORDER BY "YEAR" ASC, NUM_OF_RATINGS DESC;
-- Завершение транзакции
COMMIT;