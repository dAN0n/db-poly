SQL> SELECT * FROM AWARDS;

    AWARD_ID AW_NAME
============ ====================
           1 Grammy
           2 MTV Hits
           3 TEST

SQL> SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
Commit current transaction (y/n)?y
Committing.
/* Выполняем после COMMIT во 2 терминале */
SQL> SELECT * FROM AWARDS;

    AWARD_ID AW_NAME
============ ====================
           1 Grammy
           2 MTV Hits
           3 TEST

SQL> UPDATE AWARDS SET AW_NAME = 'TEST' WHERE AWARD_ID = 3;
Statement failed, SQLSTATE = 40001
deadlock
-update conflicts with concurrent update
-concurrent transaction number is 13816