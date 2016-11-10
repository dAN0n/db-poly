SQL> UPDATE AWARDS SET AW_NAME = 'NEW TEST' WHERE AWARD_ID = 3;
/* Запрос "висит" до команды COMMIT на первом терминале */
Statement failed, SQLSTATE = 40001
deadlock
-update conflicts with concurrent update
-concurrent transaction number is 13795