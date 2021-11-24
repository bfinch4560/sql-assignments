IF OBJECT_ID('ActressMovie') IS NOT NULL DROP TABLE ActressMovie;
IF OBJECT_ID('Movie') IS NOT NULL DROP TABLE Movie;
IF OBJECT_ID('Actress') IS NOT NULL DROP TABLE Actress;

CREATE TABLE Actress (
	actressId	INTEGER	NOT NULL,
	name	VARCHAR(50)	NOT NULL,
	agentEmail VARCHAR(50)	NOT NULL,
	CONSTRAINT actressPk PRIMARY KEY(actressId)
);

CREATE TABLE Movie (
	movieId INTEGER NOT NULL,
	title	VARCHAR(50)	NOT NULL,
	yearReleased VARCHAR(50) NOT NULL,
	totalRevenue FLOAT	NOT NULL,
	CONSTRAINT moviePk PRIMARY KEY (movieId)
);

CREATE TABLE ActressMovie (
	actressId INTEGER NOT NULL,
	movieId INTEGER NOT NULL,
	CONSTRAINT actressMoviePk PRIMARY KEY (actressId, movieId),
	CONSTRAINT actressFk FOREIGN KEY (actressId) REFERENCES Actress (actressId),
	CONSTRAINT movieFk FOREIGN KEY (movieId) REFERENCES Movie (movieId)
);

INSERT INTO Actress (actressId, name, agentEmail)
	VALUES
	(1, 'Zoe Saldana', 'amara@bigbigtalent.com'),
	(2, 'Scarlett Johanson', 'tallulah@genericagency.com'),
	(3, 'Emma Watson', 'cho@leadingtalentagency.com'),
	(4, 'Letitia Wright', 'adira@hollywoodtalent.com'),
	(5, 'Emma Thompson', 'fatima@uktalentstars.co.uk');

INSERT INTO Movie (movieId, title, yearReleased, totalRevenue)
	VALUES
	(101, 'Avatar', 2009, 2787965087),
	(102, 'Avengers: Endgame', 2019, 2797800564),
	(103, 'Ready Player One', 2018, 579278642),
	(104, 'Harry Potter and the Deathly Hallows: Part II', 2011, 1341656673),
	(105, 'Beauty and the Beast', 2017, 1263204500);

INSERT INTO ActressMovie (actressId, movieId)
	VALUES
	(2, 102),
	(4, 103),
	(3, 105),
	(1, 101),
	(4, 102),
	(5, 105),
	(1, 102),
	(3, 104),
	(5, 104);

SELECT name,
	AVG(totalRevenue) AS AverageRevenue
FROM Actress AS A, ActressMovie AS AM, Movie AS M
WHERE A.actressId = AM.actressId AND AM.movieId = M.movieId
GROUP BY A.actressId, A.name
ORDER BY AverageRevenue DESC;
	
	
	
	
	
	
	
	
	
	
	