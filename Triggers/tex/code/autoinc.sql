CREATE OR ALTER TRIGGER SEL_ID_AUTOINC FOR SELLING
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
    IF(NEW.SEL_ID IS NULL OR NEW.SEL_ID = 0) THEN NEW.SEL_ID = NEXT VALUE FOR SEL_GEN;
END
-- Завершение транзакции
COMMIT;