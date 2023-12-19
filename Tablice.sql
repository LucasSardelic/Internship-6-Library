--kreiranje tablica

CREATE TABLE Authors(
	Id SERIAL Primary Key,
	Name varchar(30)NOT null,
	LastName varchar(30)NOT null,
	DateOfBirth TIMESTAMP,
	Gender varchar(10),
	CountryId INT REFERENCES Countries(Id)
)

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

CREATE TABLE BookAuthor(
	BookId INT REFERENCES Books(Id),
	AuthorId INT REFERENCES Authors(Id),
	Primary Key (BookId, AuthorId),
	AuthorshipType varchar(10)
)