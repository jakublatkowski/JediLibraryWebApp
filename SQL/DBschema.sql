USE JediLibraryDB;

CREATE TABLE JediLibraryDB.dbo.Permissions (
ID INTEGER PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(32) NOT NULL
);

CREATE TABLE Users (
ID INteger PRIMARY KEY IDENTITY(1,1),
Username VARCHAR(64) NOT NULL,
HashedPassword VARCHAR(64) NOT NULL,
ClassID INTEGER FOREIGN KEY REFERENCES JediLibraryDB.dbo.Permissions
);

CREATE TABLE Knights (
ID INTEGER PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(32) NOT NULL,
ClassOfJediOrder VARCHAR(32) NOT NULL
);

CREATE TABLE Holocrons (
ID INTEGER PRIMARY KEY IDENTITY(1,1),
Title VARCHAR(64) NOT NULL,
YearOfPublish VARCHAR(32) NOT NULL,
Content VARCHAR(1924),
Author VARCHAR(50),
ClassID INTEGER FOREIGN KEY REFERENCES JediLibraryDB.dbo.Permissions
);

CREATE TABLE Missions (
ID INTEGER PRIMARY KEY IDENTITY(1,1),
YearOfDone VARCHAR(32),
Title VARCHAR(64) NOT NULL,
ClassID INTEGER FOREIGN KEY REFERENCES JediLibraryDB.dbo.Permissions
);

CREATE TABLE MissionMembership (
MissionID INTEGER FOREIGN KEY REFERENCES Missions,
KnightID INTEGER FOREIGN KEY REFERENCES Knights,
PRIMARY KEY(MissionID, KnightID)
);

CREATE TABLE Planets (
ID INTEGER PRIMARY KEY IDENTITY(1,1),
Name VARCHAR(50) NOT NULL,
Sector VARCHAR(50)
);

CREATE TABLE PlaceOfMission (
MissionID INTEGER FOREIGN KEY REFERENCES Missions,
PlanetID INTEGER FOREIGN KEY REFERENCES Planets,
PRIMARY KEY(MissionID, PlanetID)
);

