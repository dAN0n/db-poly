-- Инкремент количества проголосовавших
CREATE OR ALTER PROCEDURE t10 AS
BEGIN
    UPDATE ALBUMS SET NUM_OF_RATINGS=NUM_OF_RATINGS+1;
END
-- Завершение транзакции
COMMIT;