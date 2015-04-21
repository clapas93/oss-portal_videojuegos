
-- -----------------------------------------------------
-- Table Admin
-- -----------------------------------------------------
DROP TABLE IF EXISTS Admin;
CREATE TABLE IF NOT EXISTS Admin (
  adminEmail VARCHAR(318) NOT NULL, --local-part@domain 64+1+253 = 318
  name VARCHAR(45) NOT NULL,
  lastName1 VARCHAR(45) NOT NULL,
  lastName2 VARCHAR(45) NOT NULL,
  emailContact VARCHAR(318) NOT NULL,
  phone VARCHAR(13) NOT NULL, 
  password VARCHAR(255) NOT NULL, --password + salt
  PRIMARY KEY (adminEmail)
);


-- -----------------------------------------------------
-- Table Student
-- -----------------------------------------------------
DROP TABLE IF EXISTS Student;
CREATE TABLE IF NOT EXISTS Student (
  studentEmail VARCHAR(318) NOT NULL,
  name VARCHAR(45) NOT NULL,
  lastName1 VARCHAR(45) NOT NULL,
  lastName2 VARCHAR(45) NULL,
  accountNumber VARCHAR(9) NOT NULL,
  career VARCHAR(45) NOT NULL,
  password VARCHAR(255) NOT NULL,
  status CHAR NOT NULL,
  credits FLOAT NOT NULL,
  history VARCHAR(45) NOT NULL,
  PRIMARY KEY (studentEmail)
);

-- -----------------------------------------------------
-- Table Loan
-- -----------------------------------------------------
DROP TABLE IF EXISTS Loan;
CREATE TABLE IF NOT EXISTS Loan (
  studentEmail VARCHAR(318) NULL,
  adminEmail VARCHAR(318) NULL,
  date TIMESTAMP NOT NULL,
  status CHAR NOT NULL,
  creditApproved FLOAT NOT NULL,
  creditRequested FLOAT NOT NULL,
  CONSTRAINT studentEmail
    FOREIGN KEY (studentEmail)
    REFERENCES Student (studentEmail)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT adminEmail
    FOREIGN KEY (adminEmail)
    REFERENCES Admin (adminEmail)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- -----------------------------------------------------
-- Table Videogame
-- -----------------------------------------------------
DROP TABLE IF EXISTS Videogame;
CREATE TABLE IF NOT EXISTS Videogame (
  idGame SERIAL NOT NULL,
  routeGame VARCHAR(300) NOT NULL,
  front VARCHAR(60) NOT NULL,
  downloads INT NOT NULL,
  classification CHAR NOT NULL,
  price FLOAT NOT NULL,
  storageRoute VARCHAR(300) NOT NULL,
  genre VARCHAR(20) NOT NULL,
  title VARCHAR(60) NOT NULL,
  description TEXT NOT NULL,
  state VARCHAR(1) NOT NULL, --1 available, 0 Deleted
  videoUrl VARCHAR(300) NOT NULL,
  adminEmail VARCHAR(318) NULL,
  PRIMARY KEY (idGame),
  CONSTRAINT adminEmail
    FOREIGN KEY (adminEmail)
    REFERENCES Admin (adminEmail)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table Download
-- -----------------------------------------------------
DROP TABLE IF EXISTS Download;
CREATE TABLE IF NOT EXISTS Download (
  idGame SERIAL NOT NULL,
  studentEmail VARCHAR(318) NULL,
  date TIMESTAMP NOT NULL,
  CONSTRAINT idGame
    FOREIGN KEY (idGame)
    REFERENCES Videogame (idGame)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT studentEmail
    FOREIGN KEY (studentEmail)
    REFERENCES Student (studentEmail)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);