-- 09_10_23_SQL_Aggregation and Union Functions
--������� ��������� � �����������

-- ������� ������� ����� ���� � ���������� ��������� 
--������ ������� ����� ������������� ����������� 
-- ������� �������� � ��������� ���� ��� ������ �������
-- ������� ��������� ������� ���������� ����� ��� ����������� ������ �������������

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

SELECT [name] + ' ' + surname AS "���", salary + premium AS '���� ��' 
FROM doctors AS doc
UNION
SELECT '�����: ', SUM(salary + premium) 
FROM doctors

--����� ������� �� ����������

SELECT SUM(amount) AS overal, DEP.[name]
FROM
donations AS don,
departments AS dep
WHERE don.department_id = dep.id
GROUP BY dep.[name]

-- ������� ����� ������ ������� ���� � ����� ������ 

SELECT [name], SUM(salary + premium) FROM doctors
GROUP BY [name]
-- GROUP BY [name] ��� ������ �� �� ������� [name] (��� ������ �� ��������� ������� �� �����, � �� ����� ����������� ��� 
--����� ��� ���������� ����� + �������� � ���