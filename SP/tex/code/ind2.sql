/* Основная процедура */
CREATE OR ALTER PROCEDURE sp2(
    OPERATION VARCHAR(7),            -- Вид диапазона
    SUMMARY_DATE DATE                -- Дата для пересчета
)AS
DECLARE VARIABLE START_DATE DATE;    -- Дата начала диапазона
DECLARE VARIABLE FINISH_DATE DATE;   -- Дата конца диапазона
DECLARE VARIABLE DADD DATE;          -- Результат DATEADD()
DECLARE VARIABLE EXT INT;            -- Результат EXTRACT()
DECLARE VARIABLE ID INT;             -- ID городов/стран
DECLARE VARIABLE SOLD_COUNT INT;     -- Количество проданных дисков за диапазон
DECLARE VARIABLE QUERY VARCHAR(100); -- Строка с запросом
BEGIN
  IF (:OPERATION = 'DAY') THEN
  BEGIN
    /* Находим количество продаж */
    SELECT SUM(SOLD) FROM SELLING
      WHERE SOLD_DATE=:SUMMARY_DATE
      INTO :SOLD_COUNT;

    /* Добавляем новую запись либо обновляем старую */
    UPDATE OR INSERT INTO SOLD_DAY_SUMMARY
      VALUES (:SUMMARY_DATE, :SOLD_COUNT)
      MATCHING (SUMMARY_DATE);
  END

  ELSE IF (:OPERATION = 'WEEK' OR :OPERATION = 'MONTH' OR :OPERATION = 'YEAR') THEN
  BEGIN
    /* Находим начало и конец диапазона */
    IF (:OPERATION = 'WEEK') THEN BEGIN
      EXT = EXTRACT(WEEKDAY FROM :SUMMARY_DATE);
      IF (EXT = 0) THEN EXT = 7; -- Воскресенье

      START_DATE  = :SUMMARY_DATE+1-EXT;
      FINISH_DATE = :SUMMARY_DATE+7-EXT;
    END
    ELSE IF (:OPERATION = 'MONTH') THEN BEGIN
      EXT  = EXTRACT(DAY FROM :SUMMARY_DATE);
      DADD = DATEADD(MONTH, 1, :SUMMARY_DATE);

      START_DATE  = :SUMMARY_DATE-EXT+1;
      FINISH_DATE = DADD-EXTRACT(DAY FROM DADD);
    END
    ELSE IF (:OPERATION = 'YEAR') THEN BEGIN
      EXT = EXTRACT(YEARDAY FROM :SUMMARY_DATE);
      DADD = DATEADD(YEAR, 1, :SUMMARY_DATE);

      START_DATE  = :SUMMARY_DATE-EXT;
      FINISH_DATE = DADD-EXTRACT(YEARDAY FROM DADD)-1;
    END

    /* Находим количество продаж */
    SELECT SUM(SOLD) FROM SELLING
      WHERE SOLD_DATE BETWEEN :START_DATE AND :FINISH_DATE
      INTO :SOLD_COUNT;

    /* Создаем запрос */
    QUERY = 'UPDATE OR INSERT INTO SOLD_' || :OPERATION || '_SUMMARY '
      || 'VALUES (?, ?, ?) '
      || 'MATCHING (START_DATE, FINISH_DATE)';

    /* Выполнение динамического запроса */
    EXECUTE STATEMENT (QUERY) (:START_DATE, :FINISH_DATE, :SOLD_COUNT);
  END

  ELSE IF (:OPERATION = 'CITY') THEN
  BEGIN
    /* Находим кол-во продаж (диапазон не учитывается) */
    FOR SELECT CITY_ID, SUM(SOLD)
      FROM SELLING
      GROUP BY CITY_ID
      INTO :ID, :SOLD_COUNT
    DO BEGIN
      UPDATE OR INSERT INTO SOLD_CITY_SUMMARY
        VALUES (:ID, :SOLD_COUNT)
        MATCHING (CITY_ID);
    END
  END

  ELSE IF (:OPERATION = 'COUNTRY') THEN
  BEGIN
    /* Находим кол-во продаж (диапазон не учитывается) */
    FOR SELECT CITIES_IN_COUNTRY.COUNTRY_ID AS COUNTRY,
      SUM(SELLING.SOLD) FROM SELLING
      JOIN CITIES_IN_COUNTRY
      ON CITIES_IN_COUNTRY.CITY_ID = SELLING.CITY_ID
      GROUP BY COUNTRY
      INTO :ID, :SOLD_COUNT
    DO BEGIN
      UPDATE OR INSERT INTO SOLD_COUNTRY_SUMMARY
        VALUES (:ID, :SOLD_COUNT)
        MATCHING (COUNTRY_ID);
    END
  END
END
-- Завершение транзакции
COMMIT;