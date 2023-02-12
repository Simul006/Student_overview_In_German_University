
-- Show the database

show databases;

-- Use the database

use university;

-- Show the table from database

show tables
from university;

-- Looking the table enroll_student 

select*
from enroll_student;

-- Looking null values and DELETE 

SELECT *
FROM  enroll_student
WHERE Deutsche_mannlich is NULL;

DELETE  FROM  enroll_student
WHERE Deutsche_mannlich is NULL;

-- Remove Duplicates

WITH RowNumCTE AS(
Select *,
	ROW_NUMBER() OVER (
	PARTITION BY subject, Deutsche_mannlich,Deutsche_weiblich
					) row_num
					From enroll_student)
Select *
From RowNumCTE
Where row_num > 1
ORDER BY Deutsche_mannlich

-- Looking total student every year in german university from 2008 to 2021

SELECT Wintersemester,Hochschulen_insgesamt,Universit�ten,Fachhoch_schulen
FROM total_student ;


-- Looking for a German student to attend a German university until January 2023. 

SELECT Deutsche_mannlich, Deutsche_weiblich 
From enroll_student;

-- Looking how many german and non-german student enrolled in German University till January 2023. 


SELECT SUM(De_Insgesamt) AS German, SUM(Auslander_Insgesamt) AS non_german, 
(SUM(De_Insgesamt)/ SUM(Auslander_Insgesamt)) *100 AS German_percentage,
 (SUM(Auslander_Insgesamt)/SUM(De_Insgesamt)) * 100 AS Auslander_percentage
From enroll_student
ORDER BY `SemesterWS 2021/22
Studienfach` DESC ; 

-- Looking German Nationality Male and Female Student Percentage In German University till January, 2023

SELECT subject, (Deutsche_mannlich/Insgesamt) * 100 AS Deutsche_Mann,
(Deutsche_weiblich/Insgesamt) * 100 AS Deutsche_Frau
From enroll_student
ORDER BY `SemesterWS 2021/22
Studienfach` DESC;

-- Looking Auslander Male and Female Percentage Student In German University till January, 2023

SELECT subject, (Auslander_mannlich/Insgesamt) * 100 AS Auslander_Mann,
(Auslander_weiblich/Insgesamt) * 100 AS Auslander_Frau
From enroll_student
ORDER BY `SemesterWS 2021/22
Studienfach` DESC ;

-- Try to find out top subject by German male and female student 

SELECT subject, MAX(Deutsche_mannlich ) AS Man_choice, MAX(Deutsche_weiblich) As Frau_choice 
From enroll_student
WHERE  subject  is not null 
GROUP BY subject 
ORDER BY Man_choice;

SELECT *
FROM total_student ts 


-- Average student growth year to year between Hochschule und  Universitate

SELECT Wintersemester,Universit�ten/Hochschulen_insgesamt As University_student,
Hochschulen_insgesamt/Universit�ten  As Hochschulen_student
FROM total_student 
ORDER BY 1,2 DESC ;

-- Join the two table and find out the region where from most of the studnet come to germany. 

SELECT a.Hochschulen_insgesamt, a.Universit�ten, r.Column1, r.Column2 
FROM total_student a 
INNER JOIN region r 
ON r.SNM = a.SNM;

















