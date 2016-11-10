SQL> SELECT * FROM AWARDS;

    AWARD_ID AW_NAME
============ ====================
           1 Grammy
           2 MTV Hits
           3 TEST

SQL> SET TRANSACTION ISOLATION LEVEL SNAPSHOT TABLE STABILITY;
Commit current transaction (y/n)?y
Committing.
SQL> UPDATE AWARDS SET AW_NAME = 'NEW TEST' WHERE AWARD_ID = 3;
SQL> COMMIT;
SQL> SELECT * FROM AWARDS;

    AWARD_ID AW_NAME
============ ====================
           1 Grammy
           2 MTV Hits
           3 NEW TEST