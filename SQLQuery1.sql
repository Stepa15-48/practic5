CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(256) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    DeletedAt DATETIME NULL
);

CREATE TABLE Movies (
    MovieID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255) NOT NULL,
    ReleaseDate DATE,
    Genre NVARCHAR(100),
    Description NVARCHAR(MAX),
    CreatedByUserID INT FOREIGN KEY REFERENCES Users(UserID),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    DeletedAt DATETIME NULL
);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    MovieID INT FOREIGN KEY REFERENCES Movies(MovieID),
    Rating INT CHECK (Rating BETWEEN 1 AND 10),
    ReviewText NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    DeletedAt DATETIME NULL,
    DeletedByUserID INT FOREIGN KEY REFERENCES Users(UserID) NULL
);

CREATE TABLE Watchlists (
    WatchlistID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    MovieID INT FOREIGN KEY REFERENCES Movies(MovieID),
    AddedAt DATETIME DEFAULT GETDATE(),
    DeletedAt DATETIME NULL
);

CREATE TABLE Recommendations (
    RecommendationID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    MovieID INT FOREIGN KEY REFERENCES Movies(MovieID)
);
INSERT INTO Users (Username, Email, PasswordHash, CreatedAt, UpdatedAt)
VALUES 
    ('user1', 'user1@example.com', 'hashedpassword1', GETDATE(), GETDATE()),
    ('user2', 'user2@example.com', 'hashedpassword2', GETDATE(), GETDATE()),
    ('user3', 'user3@example.com', 'hashedpassword3', GETDATE(), GETDATE()),
    ('user4', 'user4@example.com', 'hashedpassword4', GETDATE(), GETDATE()),
    ('user5', 'user5@example.com', 'hashedpassword5', GETDATE(), GETDATE());
	INSERT INTO Movies (Title, ReleaseDate, Genre, Description, CreatedByUserID, CreatedAt, UpdatedAt)
VALUES 
    ('Movie Title 1', '2023-01-01', 'Action', 'Description for movie 1.', 1, GETDATE(), GETDATE()),
    ('Movie Title 2', '2023-02-01', 'Comedy', 'Description for movie 2.', 2, GETDATE(), GETDATE()),
    ('Movie Title 3', '2023-03-01', 'Drama', 'Description for movie 3.', 3, GETDATE(), GETDATE()),
    ('Movie Title 4', '2023-04-01', 'Horror', 'Description for movie 4.', 4, GETDATE(), GETDATE()),
    ('Movie Title 5', '2023-05-01', 'Sci-Fi', 'Description for movie 5.', 5, GETDATE(), GETDATE());
	INSERT INTO Reviews (UserID, MovieID, Rating, ReviewText, CreatedAt, UpdatedAt)
VALUES 
    (1, 1, 8, 'Great action movie!', GETDATE(), GETDATE()),
    (2, 2, 7, 'Funny and entertaining.', GETDATE(), GETDATE()),
    (3, 3, 9, 'Very touching story.', GETDATE(), GETDATE()),
    (4, 4, 6, 'Not scary enough for me.', GETDATE(), GETDATE()),
    (5, 5, 10, 'Mind-blowing sci-fi experience!', GETDATE(), GETDATE());
	INSERT INTO Watchlists (UserID, MovieID, AddedAt)
VALUES 
    (1, 2, GETDATE()),
    (2, 3, GETDATE()),
    (3, 4, GETDATE()),
    (4, 5, GETDATE()),
    (5, 1, GETDATE());
	INSERT INTO Recommendations (UserID, MovieID)
VALUES 
    (1, 3),
    (2, 4),
    (3, 5),
    (4, 1),
    (5, 2);