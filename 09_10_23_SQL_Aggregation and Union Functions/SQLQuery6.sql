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

/*
////////////////////////////////////////
alter table Doctors
add Premium money not NULL default(0) constraint ch_doctor check (Premium > = 0);

Эта запись означает, что в таблице Doctors будет добавлен столбец с названием Premium, который будет хранить данные типа money.
Столбец не может содержать значения NULL и по умолчанию будет иметь значение 0. 
Также будет создано ограничение ch_doctor, которое гарантирует, что значения в столбце Premium не могут быть меньше нуля.
/////////////////////////////

Конечно! Давайте рассмотрим примеры заполнения таблицы на SQL Server с использованием команд Insert, Select, Update и Delete.

Пример таблицы:

CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(50)
);

1. Insert (Вставка данных):
INSERT INTO Employees (ID, Name, Age, Department)
VALUES (1, 'John Doe', 25, 'HR');

Эта команда вставляет новую запись в таблицу Employees. Мы указываем столбцы, в которые будут вставлены данные (ID, Name, Age, Department), 
а затем указываем значения для каждого столбца ('John Doe' - имя, 25 - возраст, 'HR' - отдел).

ВОЗМОЖНЫЕ ОШИБКИ ПРИ ЗАПОЛНЕНИИ!!!
............
Если добавляем дату то :
Дата должна быть заключена в кавычки и иметь формат 'гггг-мм-дд'. 
Поправленный вариант запроса выглядит таким образом:

INSERT INTO Teachers(ID, Name, EmploymentDate, Premium, Salary)
VALUES (1, 'John Doe', '2023-02-10', 10000, 50000);
Теперь дата '2023-02-10' заключена в одинарные кавычки и имеет правильный формат год-месяц-день.
...............
.........
Ошибка возникает потому, что столбец ID установлен как IDENTITY,
что означает, что значения для этого столбца будут генерироваться автоматически базой данных, 
а не вручную вставляться.
Чтобы решить эту проблему, вы можете удалить столбец ID из запроса вставки,
и база данных автоматически сгенерирует соответствующее значение для этого столбца. 
Вот исправленный вариант запроса:

INSERT INTO Teachers(Name, EmploymentDate, Premium, Salary)
VALUES ('John Doe', '2023-02-10', 10000, 50000);
Теперь запрос должен выполниться успешно, без ошибки связанной с полем IDENTITY.
..............
Добавление сразу нескольких записей!!!
.................
Чтобы добавить сразу несколько записей в SQL Server, вы можете использовать оператор INSERT INTO с упоминанием нескольких значений в блоке VALUES. Вот пример:

INSERT INTO Teachers(Name, EmploymentDate, Premium, Salary)
VALUES 
  ('John Doe', '2023-02-10', 10000, 50000),
  ('Jane Smith', '2022-05-15', 5000, 45000),
  ('David Johnson', '2022-08-20', 8000, 55000);

Этот пример добавляет три записи в таблицу Teachers с различными значениями для каждой записи. 
Вы можете продолжить добавлять столько записей, сколько вам нужно, 
просто продолжайте перечислять их в блоке VALUES, разделяя их запятыми.
.....................................

2. Select (Выборка данных):
SELECT  FROM Employees;

Эта команда выбирает все данные из таблицы Employees. Звездочка () означает выбрать все столбцы.

3. Update (Обновление данных):
UPDATE Employees
SET Age = 30
WHERE ID = 1;

Эта команда обновляет данные в таблице Employees. Мы указываем столбец, который нужно обновить (Age) и новое значение (30). 
Затем с помощью условия WHERE указываем, какую запись нужно обновить (в данном случае запись с ID = 1).

4. Delete (Удаление данных):
DELETE FROM Employees
WHERE ID = 1;

Эта команда удаляет запись из таблицы Employees. Мы указываем, какую запись нужно удалить (в данном случае запись с ID = 1) с помощью условия WHERE.

Шаг за шагом:
- Сначала создается таблица Employees.
- Затем с помощью команды Insert вставляется новая запись в таблицу.
- С помощью команды Select выбираются все данные из таблицы для проверки.
- С помощью команды Update обновляется одна из записей таблицы.
- С помощью команды Delete удаляется одна из записей таблицы.

.................
УДАЛЕНИЕ СТОЛБЦА!
.....................
Чтобы удалить столбец из таблицы в SQL Server, можно использовать команду ALTER TABLE.
Вот пример удаления столбца "Premium" из таблицы "Teachers":

ALTER TABLE Teachers
DROP COLUMN Premium;

После выполнения этой команды столбец "Premium" будет удален из таблицы "Teachers".
Обратите внимание, что операция удаления столбца может быть необратимой и может привести к потере данных,
поэтому перед выполнением этой команды убедитесь, что вы не удаляете важные данные и создайте резервную копию таблицы.
........................

УДАЛЕНИЕ СТОЛБЦА! С ОГРАНИЧЕНИЕМ!!
...................
Из вашего примера видно, что вы хотите удалить ограничение CHECK с именем "ch_FirstName", а не сам столбец "FirstName". Попробуйте следующую команду, чтобы удалить ограничение CHECK:

ALTER TABLE Teachers
DROP CONSTRAINT ch_FirstName;

Здесь мы используем команду ALTER TABLE DROP CONSTRAINT для удаления ограничения "ch_FirstName" из таблицы "Teachers". 
После выполнения этой команды ограничение будет удалено, и вы сможете изменить или удалить столбец "FirstName" без проблем.

Если вы всё же хотите удалить сам столбец "FirstName", убедитесь, что никакие другие объекты не зависят от него 
(например, внешние ключи, представления или триггеры). Если есть зависимости, их также необходимо изменить или удалить перед удалением столбца.
..................

ЗАПОЛНЕНИЕ ТАБЛИЦИ СО ССЫЛОЧНЫМИ ЗНАЧЕНИЯМИ ИЗ ДРУГОЙ ТАБЛИЦИ! С ОПЕРАТОРАМИ INSERT INTO И SELECT WHERE!!!!!
........................
Да, можно использовать запросы SELECT в операторе INSERT INTO, чтобы автоматически подставлять значения из других таблиц. В вашем случае, чтобы получить значения subject_id и teacher_id из таблиц Subjects и Teachers, можно использовать следующий код с использованием оператора SELECT:

INSERT INTO Lectures (LectureRoom, subject_id, teacher_id)
SELECT 'Lecture Room 1', Id, Id
FROM Subjects
WHERE SubjectName = 'Subject 1';

В этом примере, мы используем оператор SELECT, чтобы выбрать значения Id из таблицы Subjects,
где SubjectName равно 'Subject 1'. Затем, в операторе INSERT INTO, мы подставляем выбранные значения
Id как значения для столбцов subject_id и teacher_id в таблице Lectures.

Если вы хотите использовать значения из таблицы Teachers, то вам нужно выполнить аналогичный запрос SELECT,
указав таблицу и условия для выбора соответствующего значения.

Вы можете настроить условия WHERE для выбора нужных значений из других таблиц в соответствии с вашими требованиями.


,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
1. Неверно использована конструкция 
"SELECT ([LectureRoom], sud_id, teach_id) AS (VALUE('Желтая аудитория 1'),sud_id, teach_id)". 
Вместо этого нужно просто указать значения, которые нужно вставить в таблицу, разделив их запятой. 
То есть в данном случае должно быть "SELECT 'Желтая аудитория 1', sud_id, teach_id".

2. Необходимо использовать оператор JOIN для объединения таблиц Subjects и Teachers по правильным полям,
чтобы получить значения sud_id и teach_id. В данном случае, предполагая, что поля subject_id и teacher_id
являются внешними ключами в таблице Lectures, мы можем использовать следующее:

SELECT 'Желтая аудитория 1', Sub.subject_id, Teach.teacher_id
FROM Subjects AS Sub
JOIN Teachers AS Teach
ON Sub.subject_id = Teach.teacher_id

3. Неверное использование синтаксиса WHERE. Вместо "WHERE Sud.sud_id = Teach.teach_id"
нужно использовать "WHERE Sub.subject_id = Teach.teacher_id".

Итоговый SQL запрос будет выглядеть следующим образом:
INSERT INTO [dbo].[Lectures]([LectureRoom], [subject_id], [teacher_id])
SELECT 'Желтая аудитория 1', Sub.subject_id, Teach.teacher_id
FROM Subjects AS Sub
JOIN Teachers AS Teach
ON Sub.subject_id = Teach.teacher_id
\\\\\\\
Вы можете использовать ключевое слово "VALUES" для добавления новых значений в таблицу Lectures. Пример:

INSERT INTO [Lectures]([LectureRoom], [subject_id], [teacher_id])
VALUES ('Желтая аудитория 1', (SELECT [id] FROM [dbo].[Subjects]), (SELECT [Id] FROM [dbo].[Teachers]))
\\\\\\\
,,,,,,,,,,,,,,,,,,,,,,,,,,,
......................................

ПРОВЕРКА ЗАПОЛНЕНИЯ ФИО ИЗ 3-Х ЧАСТЕЙ ФУНКЦИЯ!!
...........................................................
Чтобы сделать проверку ФИО на заполнение из Фамилии, Имени и Отчества в SQL Server, 
вы можете использовать функции разбора строки их ФИО и проверки на наличие всех трех частей.

Вот пример, как вы можете это сделать:

-- Создание функции проверки ФИО на заполнение всех трех частей
CREATE FUNCTION dbo.CheckFullName (@FullName NVARCHAR(100)) 
RETURNS BIT 
AS 
BEGIN 
  DECLARE @LastName NVARCHAR(50),
          @FirstName NVARCHAR(50),
          @MiddleName NVARCHAR(50),
          @Result BIT

  -- Разделение ФИО на Фамилию, Имя и Отчество
  SELECT @LastName = PARSENAME(REPLACE(@FullName, ' ', '.'), 3),
         @FirstName = PARSENAME(REPLACE(@FullName, ' ', '.'), 2),
         @MiddleName = PARSENAME(REPLACE(@FullName, ' ', '.'), 1)

  -- Проверка на заполнение всех трех частей ФИО
  IF @LastName IS NOT NULL AND @FirstName IS NOT NULL AND @MiddleName IS NOT NULL
      SET @Result = 1
  ELSE
      SET @Result = 0

  RETURN @Result 
END
GO

-- Пример использования функции проверки при вставке записи
DECLARE @Name NVARCHAR(100),
        @EmploymentDate DATE,
        @Premium FLOAT,
        @Salary FLOAT

SET @Name = 'Александр Сергеевич Бунша'
SET @EmploymentDate = '2023-03-01'
SET @Premium = 12000
SET @Salary = 40000

IF dbo.CheckFullName(@Name) = 1
    INSERT INTO Teachers(Name, EmploymentDate, Premium, Salary)
    VALUES (@Name, @EmploymentDate, @Premium, @Salary)
ELSE
    PRINT 'ФИО должно содержать Фамилию, Имя и Отчество'

В этом примере создается функция dbo.CheckFullName, которая разбивает строку ФИО на Фамилию (@LastName),
Имя (@FirstName) и Отчество (@MiddleName). Затем функция проверяет наличие всех трех частей ФИО и возвращает значение 1,
если все три части заполнены, и 0 в противном случае.

При вставке записи функция проверки применяется к столбцу Name, и если все три части ФИО заполнены,
запись будет добавлена в таблицу Teachers. В противном случае будет выведено сообщение о том, 
что ФИО должно содержать Фамилию, Имя и Отчество.
................................................................................

////////////////////////////////////////
*/