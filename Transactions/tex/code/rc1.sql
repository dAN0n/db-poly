SQL> SELECT * FROM AWARDS;

    AWARD_ID AW_NAME
============ ====================
           1 Grammy
           2 MTV Hits
           3 TEST

SQL> SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
Commit current transaction (y/n)?y
Committing.
SQL> SELECT * FROM AWARDS;
/* Запрос "висит" до команды COMMIT на втором терминале */

    AWARD_ID AW_NAME
============ ====================
           1 Grammy
           2 MTV Hits
           3 NEW TEST