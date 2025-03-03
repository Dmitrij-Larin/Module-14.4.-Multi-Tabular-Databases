SELECT COUNT(*) AS CountStudents, City
FROM Students
GROUP BY City
HAVING City = 'Moscow'
ORDER BY City

SELECT COUNT(*) AS CountStudents, Country
FROM Students
GROUP BY Country
HAVING Country = 'UK'
ORDER BY Country

SELECT COUNT(*) AS CountStudents, SubjectName, MIN(Assesment) AS MinAssesment
FROM Students AS ST, Subjects AS SB, Achievements AS A
WHERE ST.id = A.StudentId AND ST.id = SB.id
GROUP BY SubjectName
HAVING SubjectName = 'Discrete Math'
ORDER BY SubjectName;

SELECT COUNT(*) AS CountStudents, SubjectName, MAX(Assesment) AS MaxAssesment
FROM Students AS ST, Subjects AS SB, Achievements AS A
WHERE ST.id = A.StudentId AND ST.id = SB.id
GROUP BY SubjectName
HAVING SubjectName = 'Discrete Math'
ORDER BY SubjectName;

SELECT COUNT(*) AS CountStudents, GroupName
FROM Students AS S, Groups AS G
WHERE S.GroupId = G.FacultyID
GROUP BY GroupName;

SELECT AVG(Assesment) AS AVGAssesment, GroupName
FROM Achievements AS A, Groups AS G
WHERE A.id = G.Id
GROUP BY GroupName;