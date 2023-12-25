--kreiranje tablica

CREATE TABLE Authors(
	Id SERIAL Primary Key,
	Name varchar(30)NOT null,
	LastName varchar(30)NOT null,
	DateOfBirth TIMESTAMP,
	Gender varchar(10),
	CountryId INT REFERENCES Countries(Id)
)
ALTER TABLE Authors
	ADD COLUMN DateOfDeath TIMESTAMP
ALTER TABLE Authors
	ADD CONSTRAINT age CHECK(DateOfDeath > DateOfBirth)

CREATE TABLE Countries(
	Id SERIAL Primary Key,
	Name varchar(50)NOT null,
	Population int,
	AveragePay float
)

CREATE TABLE Books(
	Id SERIAL Primary Key,
	Type varchar(20),
	DateOfPublishing TIMESTAMP,
	Name varchar(50)NOT null
)

CREATE TABLE Copies(
	Id SERIAL Primary Key,
	LibraryId INT REFERENCES Libraries(Id),
	BookId INT REFERENCES Books(Id)
)

CREATE TABLE Libraries(
	Id SERIAL Primary Key,
	Name varchar(30)NOT null,
	WorkHours tsrange,
	Librarian varchar(50)NOT null
)
ALTER TABLE Libraries
	DROP COLUMN WorkHours,
	ADD COLUMN OpeningTime varchar(5),
	ADD COLUMN ClosingTime varchar(5)

CREATE TABLE Users(
	Id SERIAL Primary Key,
	Name varchar(50)NOT null
)

CREATE TABLE Borrowings(
	Id SERIAL Primary Key,
	CopyId INT REFERENCES Copies(Id),
	UserId INT REFERENCES Users(Id),
	DateOfBorrowing TIMESTAMP
)
ALTER TABLE Borrowings
	ADD COLUMN DateOfReturning TIMESTAMP
ALTER TABLE Borrowings
	ADD CONSTRAINT PosudenaKnjiga CHECK(DateOfReturning>DateOfBorrowing)
	--ADD CONSTRAINT borrowingsMax CHECK((SELECT COUNT(*) FROM Borrowings br GROUP BY br.UserId)<4)

CREATE TABLE BookAuthor(
	BookId INT REFERENCES Books(Id),
	AuthorId INT REFERENCES Authors(Id),
	Primary Key (BookId, AuthorId),
	AuthorshipType varchar(10)
)
ALTER TABLE BookAuthor
	ADD CONSTRAINT uniqueBA UNIQUE (BookId, AuthorId)

CREATE PROCEDURE BorrowBook(CopiesId INT, UsersId INT)
LANGUAGE SQL
AS $$
insert into Borrowings(CopyId, UserId, DateOfBorrowing, DateOfReturning) values (CopiesId, UsersId, NOW(), NOW()+INTERVAL '20 days')
$$