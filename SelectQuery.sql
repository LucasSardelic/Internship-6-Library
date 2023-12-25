--select query

SELECT a.Name, LastName, Gender, c.Name AS CountryName, c.AveragePay FROM Authors a
JOIN Countries c ON a.CountryId = c.Id

SELECT b.Name, DateOfPublishing, 
(SELECT STRING_AGG(a.Name || LEFT(a.LastName, 1) || '.', ' + ') FROM Authors a
WHERE (SELECT COUNT(*) FROM BookAuthor ba WHERE ba.BookId = b.Id AND a.Id = ba.AuthorId AND ba.AuthorshipType = 'glavni')>0)
FROM Books b
WHERE b.Type = 'znanstvena'

SELECT Name,
COALESCE(CAST((SELECT br.DateOfBorrowing FROM Borrowings br
		 JOIN Copies cp ON br.CopyId=cp.Id AND cp.BookId=b.Id)as varchar),'None') AS Borrowed
FROM Books b

SELECT l.Name, Count(*) AS NumberOfBooks FROM Libraries l
JOIN Copies cp ON cp.LibraryId=l.Id
GROUP BY l.Name
ORDER BY NumberOfBooks DESC
LIMIT 3

SELECT b.Name, Count(*) AS NumberOfReaders FROM Books b
JOIN Copies cp ON cp.BookId=b.Id
JOIN Borrowings br ON br.CopyId=cp.Id
JOIN Users u ON u.Id = br.UserId
GROUP BY b.Name
ORDER BY NumberOfReaders DESC

SELECT u.Name FROM Users u
JOIN Borrowings bo ON bo.UserId=u.Id
WHERE bo.DateOfReturning > NOW()

SELECT a.Name FROM Authors a
JOIN BookAuthor ba ON ba.AuthorId=a.Id
JOIN Books b ON b.Id=ba.BookId
WHERE DATE_PART('year', b.DateOfPublishing) > 2018 AND DATE_PART('year', b.DateOfPublishing) < 2023

SELECT co.Name, COUNT(b) FROM Countries co
JOIN Authors a ON a.CountryId=co.Id
JOIN BookAuthor ba ON ba.AuthorId = a.Id
JOIN Books b ON ba.BookId = b.Id
WHERE b.Type = 'umjetnicka'
GROUP BY co.Name
ORDER BY (SELECT COUNT(*) FROM Authors z WHERE z.DateOfDeath>NOW()) DESC

SELECT a.Name, 
	COUNT(b.Type='lektira') AS Lektira,
	COUNT(b.Type='umjetnicka') AS Umjetnicka,
	COUNT(b.Type='znanstvena') AS Znanstvena,
	COUNT(b.Type='biografija') AS Biografija,
	COUNT(b.Type='strucna') AS Strucna
FROM Authors a
JOIN BookAuthor ba ON ba.AuthorId = a.Id
JOIN Books b ON ba.BookId = b.Id
GROUP BY a.Name, b.Type

--Nasao sam na netu kako pronaci dan u tjednu iz TIMESTAMPA, tako da sam planirao za ovaj zadatak
--napraviti for petlju koja bi isla od NOW() do DateOfReturning i s bzirom na dan u tjedu
--povecavala sumu koju bi deklarirao prije, ali imam problea sa deklaracijom
SELECT Name, 
	COALESCE(CAST((declare f integer := 0;
				   do$$
				   for counter NOW()
				   end;$$
	)as varchar),'Cisto') AS Dug
FROM Users u
JOIN Borrowings bo ON bo.UserId=u.Id

SELECT DISTINCT ON (a.Id) a.Name, b.Name AS BookName FROM Authors a
JOIN BookAuthor ba ON ba.AuthorId = a.Id
JOIN Books b ON ba.BookId = b.Id
ORDER BY a.Id, b.DateOfPublishing

SELECT DISTINCT ON (co.Id) co.Name, b.Name AS BookName FROM Countries co
JOIN Authors a ON a.CountryId=co.Id
JOIN BookAuthor ba ON ba.AuthorId = a.Id
JOIN Books b ON ba.BookId = b.Id
ORDER BY co.Id, b.DateOfPublishing
LIMIT 1 OFFSET 1

SELECT 
	CASE WHEN COUNT(br)>9 THEN b.Name
	END AS Name,
	COUNT(br)
FROM Books b
JOIN Copies cp ON cp.BookId=b.Id
JOIN Borrowings br ON br.CopyId=cp.Id
WHERE br.DateOfBorrowing < NOW() AND br.DateOfReturning < NOW()
GROUP BY b.Name

--Interpretiram zadatak kao da s treba pronaci koja je knjiga citana prosjeco u datoj drzavi
SELECT co.Name, b.Name, 
COUNT(br)/(SELECT COUNT(*) FROM Borrowings bor
		  JOIN Copies cop ON cop.Id=bor.CopyId
		  JOIN Books book ON cop.BookId=book.Id
		  JOIN BookAuthor boa ON boa.BookId=book.Id
		  JOIN Authors aut ON boa.AuthorId=aut.Id
		  JOIN Countries coun ON aut.CountryId=coun.Id
		  WHERE coun.Name=co.NAME) AS ProsjekPosudbi
FROM Countries co
JOIN Authors a ON a.CountryId=co.Id
JOIN BookAuthor ba ON ba.AuthorId = a.Id
JOIN Books b ON ba.BookId = b.Id
JOIN Copies cp ON cp.BookId=b.Id
JOIN Borrowings br ON br.CopyId=cp.Id
GROUP BY co.Name, b.Name
ORDER BY co.Name, b.Name DESC

SELECT COUNT(*), 'autor' AS Struka, DATE_PART('year', a.DateOfBirth)/10 AS Desetljece, a.Gender FROM Authors a
JOIN BookAuthor ba ON ba.AuthorId=a.Id
WHERE ((SELECT COUNT(*) FROM Books b where b.Id=ba.BookId)>5)
GROUP BY DATE_PART('year', a.DateOfBirth)/10, a.Gender
ORDER BY DATE_PART('year', a.DateOfBirth)/10

--Iskreno, ne znam zasto ovo ne funkcionira. Ne zeli runnat u trenutku kad dodam sqrt.
--Kad ga skinem radi uredu, a probao sam castat bez rezultata, tako da ako imate ideju...
SELECT a.Name FROM Authors a
JOIN BookAuthor ba ON ba.AuthorId=a.Id
JOIN Books b ON ba.BookId = b.Id
ORDER BY (sqrt(SELECT COUNT(*) FROM Copies cp WHERE cp.BookId=b.Id)
		  /(SELECT COUNT(*) FROM Authors z where b.Id=ba.BookId AND ba.AuthorId = z.Id)) DESC
LIMIT 10
