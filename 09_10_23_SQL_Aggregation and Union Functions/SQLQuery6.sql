-- 09_10_23_SQL_Aggregation and Union Functions
--Функции Агрегации и Объединения

-- Вывести сколько палат есть в конкретном отделении 
--Задача Вывести сумму пожертвований кардиологии 
-- Вывести докторов с зарплатой ниже или равной средней
-- Вывести спонсоров которые жертвовали боьше чем минимальный размер пожертвования

SELECT COUNT(*) AS Department_1
FROM wards
WHERE [departments_id] = 1


SELECT SUM(amount) AS TotalDonations
FROM donations
WHERE [department_id] = 1



SELECT *
FROM doctors 
WHERE salary <= (SELECT AVG(salary) FROM doctors)

SELECT [name] AS SponsoreName 
FROM sponsors
WHERE id IN(
SELECT DISTINCT sponsor_id
FROM donations
WHERE amount >(
SELECT MIN(amount)
FROM donations
)
);

SELECT [name] + ' ' + surname AS "ФИО", salary + premium AS 'Фонд ЗП' 
FROM doctors AS doc
UNION
SELECT 'всего: ', SUM(salary + premium) 
FROM doctors

--Сумма Донатов по отделениям

SELECT SUM(amount) AS overal, DEP.[name]
FROM
donations AS don,
departments AS dep
WHERE don.department_id = dep.id
GROUP BY dep.[name]

-- Выясним каким именам сколько кому в сумме платят 

SELECT [name], SUM(salary + premium) FROM doctors
GROUP BY [name]
-- GROUP BY [name] она выдает ту же таблицу [name] (Она бъется на маленькие выборки по имени, и по имени суммируется все 
--тоест все одинаковые Имена + зарплату у них