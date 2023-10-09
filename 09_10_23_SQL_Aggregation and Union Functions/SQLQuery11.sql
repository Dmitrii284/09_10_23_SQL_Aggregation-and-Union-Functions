

-- 09_10_23_SQL_Aggregation and Union Functions
--Функции Агрегации и Объединения

-- Вывести сколько палат есть в конкретном отделении 
--Задача Вывести сумму пожертвований кардиологии 


SELECT SUM(amount) AS TotalDonations
FROM donations
WHERE departaments_id = 1