CREATE OR ALTER TRIGGER aggregate FOR SELLING
ACTIVE BEFORE INSERT POSITION 0
AS
DECLARE VARIABLE OLD_DATE DATE;
DECLARE VARIABLE OLD_START_WEEK DATE;
DECLARE VARIABLE NEW_START_WEEK DATE;
DECLARE VARIABLE EXT INT;
BEGIN
    SELECT FIRST 1 SOLD_DATE FROM SELLING ORDER BY SEL_ID DESC INTO :OLD_DATE;

    /* Получение дат начала недель */
    EXT = EXTRACT(WEEKDAY FROM :OLD_DATE);
    IF (EXT = 0) THEN EXT = 7; -- Воскресенье
    OLD_START_WEEK = :OLD_DATE+1-EXT;

    EXT = EXTRACT(WEEKDAY FROM NEW.SOLD_DATE);
    IF (EXT = 0) THEN EXT = 7;
    NEW_START_WEEK = NEW.SOLD_DATE+1-EXT;

    IF (:OLD_DATE != NEW.SOLD_DATE) THEN
        EXECUTE PROCEDURE SP2 'DAY', :OLD_DATE;
    IF (:OLD_START_WEEK != :NEW_START_WEEK) THEN
        EXECUTE PROCEDURE SP2 'WEEK', :OLD_DATE;
    IF (DATEDIFF(MONTH, :OLD_DATE, NEW.SOLD_DATE) > 0) THEN
        EXECUTE PROCEDURE SP2 'MONTH', :OLD_DATE;
    IF (DATEDIFF(YEAR, :OLD_DATE, NEW.SOLD_DATE) > 0) THEN
        EXECUTE PROCEDURE SP2 'YEAR', :OLD_DATE;
    EXECUTE PROCEDURE SP2 'CITY', :OLD_DATE;
    EXECUTE PROCEDURE SP2 'COUNTRY', :OLD_DATE;
END
-- Завершение транзакции
COMMIT;