

-- 09_10_23_SQL_Aggregation and Union Functions
--������� ��������� � �����������

-- ������� ������� ����� ���� � ���������� ��������� 
--������ ������� ����� ������������� ����������� 


SELECT SUM(amount) AS TotalDonations
FROM donations
WHERE departaments_id = 1