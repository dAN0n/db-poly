/* Таблица для теста */
SQL> SELECT * FROM AWARDS;

    AWARD_ID AW_NAME
============ ====================
           1 Grammy
           2 MTV Hits

/* Добавим запись */
SQL> INSERT INTO AWARDS VALUES (3, 'TEST');
SQL> SELECT * FROM AWARDS;

    AWARD_ID AW_NAME
============ ====================
           1 Grammy
           2 MTV Hits
           3 TEST

/* Отмена транзакции */
SQL> ROLLBACK;
SQL> SELECT * FROM AWARDS;

    AWARD_ID AW_NAME
============ ====================
           1 Grammy
           2 MTV Hits

/* Добавим запись снова, но подтвердим транзакцию */
SQL> INSERT INTO AWARDS VALUES (3, 'TEST');
SQL> COMMIT;
SQL> SELECT * FROM AWARDS;

    AWARD_ID AW_NAME
============ ====================
           1 Grammy
           2 MTV Hits
           3 TEST

/* Удалим запись */
SQL> DELETE FROM AWARDS WHERE AWARD_ID = 3;
SQL> SELECT * FROM AWARDS;

    AWARD_ID AW_NAME
============ ====================
           1 Grammy
           2 MTV Hits

/* Создадим точку сохранения и добавим запись снова */
SQL> SAVEPOINT FIRST;
SQL> INSERT INTO AWARDS VALUES (3, 'TEST');
/* Повторим процесс */
SQL> SAVEPOINT SEC;
SQL> INSERT INTO AWARDS VALUES (4, 'TEST2');
SQL> SELECT * FROM AWARDS;

    AWARD_ID AW_NAME
============ ====================
           1 Grammy
           2 MTV Hits
           3 TEST
           4 TEST2

/* Откатим транзакцию на 2-ую точку сохранения */
SQL> ROLLBACK TO SEC;
SQL> SELECT * FROM AWARDS;

    AWARD_ID AW_NAME
============ ====================
           1 Grammy
           2 MTV Hits
           3 TEST

/* Откатим транзакцию на 1-ую точку сохранения */
SQL> ROLLBACK TO FIRST;
SQL> SELECT * FROM AWARDS;

    AWARD_ID AW_NAME
============ ====================
           1 Grammy
           2 MTV Hits

/* Завершение транзакции */
SQL> COMMIT;