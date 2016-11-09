CREATE OR ALTER PROCEDURE sp1(
    START_DATE DATE,
    FINISH_DATE DATE,
    AWARD_ID INTEGER
)
AS
DECLARE VARIABLE TOP_ALBUM INTEGER;
DECLARE VARIABLE ID INTEGER;
BEGIN
    /* Находим самый продаваемый альбом */
    SELECT FIRST 1 ALB_IN_CD.ALB_ID AS ALB FROM SELLING
        JOIN ALB_IN_CD ON SELLING.CD_ID = ALB_IN_CD.CD_ID
        WHERE SOLD_DATE BETWEEN :START_DATE AND :FINISH_DATE
        GROUP BY ALB
        ORDER BY SUM(SOLD) DESC
        INTO :TOP_ALBUM;
    /* Вычисляем количество записей в таблице */
    SELECT COUNT(*) FROM (SELECT * FROM ALB_AWARDS) INTO :ID;
    /* Инкрементируем первичный ключ */
    ID = ID + 1;
    /* Добавляем запись */
    INSERT INTO ALB_AWARDS VALUES (:ID, :TOP_ALBUM, :AWARD_ID);
END
-- Завершение транзакции
COMMIT;