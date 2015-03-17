-- -----------------------------------------------------
-- Table  Alumno 
-- -----------------------------------------------------

CREATE TABLE Alumno  (
   email_alumno  VARCHAR(45) NOT NULL,
   Nombres  VARCHAR(45) NOT NULL,
   Apellidos  VARCHAR(45) NOT NULL,
   numero_cuenta  VARCHAR(9) NOT NULL,
   carrera  VARCHAR(45) NOT NULL,
   credito  FLOAT NOT NULL,
   password  VARCHAR(45) NOT NULL,
   historial_academico  VARCHAR(45) NOT NULL,
  PRIMARY KEY ( email_alumno ));


-- -----------------------------------------------------
-- Table  Videojuego 
-- -----------------------------------------------------

CREATE TABLE Videojuego  (
   idVideojuego  INT NOT NULL,
   precio  FLOAT NOT NULL,
   ruta_almacenamiento  VARCHAR(45) NOT NULL,
   portada  VARCHAR(45) NOT NULL,
   título  VARCHAR(45) NOT NULL,
   descripción  VARCHAR(200) NOT NULL,
   Ruta_juego  VARCHAR(45) NOT NULL,
  PRIMARY KEY ( idVideojuego )
  );


-- -----------------------------------------------------
-- Table  Descargar 
-- -----------------------------------------------------


CREATE TABLE Descargar  (
   email_alumno  VARCHAR(45) REFERENCES Alumno (email_alumno),
   id_videojuego INT REFERENCES Videojuego(idVideojuego)
   );


-- -----------------------------------------------------
-- Table  Administrador 
-- -----------------------------------------------------


CREATE TABLE Administrador  (
   email_admin  VARCHAR(45) NOT NULL,
   password  VARCHAR(45) NOT NULL,
   email_contacto  VARCHAR(45) NOT NULL,
   telefono  VARCHAR(45) NULL,
   nombres  VARCHAR(45) NOT NULL,
   apellidos  VARCHAR(45) NOT NULL,
  PRIMARY KEY ( email_admin ));


-- -----------------------------------------------------
-- Table  Otorgar_prestamo 
-- -----------------------------------------------------


CREATE TABLE Otorgar_prestamo  (
   email_alumno  VARCHAR(45) REFERENCES Alumno(email_alumno),
   email_admin  VARCHAR(45) REFERENCES Administrador(email_admin),
   cantidad_credito  FLOAT NOT NULL,
   fecha  DATE NOT NULL,
   aprobado  CHAR NOT NULL
   );


-- -----------------------------------------------------
-- Table  Ofrecer 
-- -----------------------------------------------------

CREATE TABLE Ofrecer  (
   email_admin  VARCHAR(45) REFERENCES Administrador(email_admin),
   id_videojuego  INT REFERENCES Videojuego(idVideojuego)
   );
