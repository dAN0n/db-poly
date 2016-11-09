CREATE SEQUENCE SEL_GEN;
ALTER SEQUENCE SEL_GEN RESTART WITH 28; -- Установка значения генератора
-- Завершение транзакции
COMMIT;