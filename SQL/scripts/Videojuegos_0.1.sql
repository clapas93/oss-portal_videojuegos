
CREATE DATABASE "videoGames"
  WITH OWNER = Optimal
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'es_MX.UTF-8'
       LC_CTYPE = 'es_MX.UTF-8'
       CONNECTION LIMIT = -1;
-- -----------------------------------------------------
-- Table Admin
-- -----------------------------------------------------
DROP TABLE IF EXISTS Admin CASCADE;
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
DROP TABLE IF EXISTS Student CASCADE;
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
DROP TABLE IF EXISTS Loan CASCADE;
CREATE TABLE IF NOT EXISTS Loan (
  studentEmail VARCHAR(318) NOT NULL,
  adminEmail VARCHAR(318) NOT NULL,
  date TIMESTAMP NOT NULL,
  status CHAR NOT NULL,
  creditApproved FLOAT NOT NULL,
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
DROP TABLE IF EXISTS Videogame CASCADE;
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
  adminEmail VARCHAR(318) NOT NULL,
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
DROP TABLE IF EXISTS Download CASCADE;
CREATE TABLE IF NOT EXISTS Download (
  idGame SERIAL NOT NULL,
  studentEmail VARCHAR(318) NOT NULL,
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
-----------------------
--Insertions
-----------------------
INSERT INTO admin values ('admin@oss.com','Eduardo','Miranda','Sánchez','eduardomiranda@ciencias.unam.mx','5519134399','password');
INSERT INTO student (studentemail,name,lastname1,lastname2,accountnumber,career,password,status,credits,history)
VALUES ('null@mail.com','null','null','null','000000000','CC.','null','x',0,'');


INSERT INTO videogame (idgame,routegame,front,downloads,classification,price,storageroute,genre,title,description,state,videourl,adminemail) 

VALUES (1,'http://pulsegames.com/videogames/1','front_1.jpg',0,'M',850,'game_1.zip','Acción','The Last of Us',
  'Ciudades abandonadas e invadidas por la naturaleza. Una población diezmada por una plaga moderna. Los supervivientes se matan unos a 
  otros por comida, armas; cualquier cosa a la que puedan echar mano. Joel, un superviviente brutal, y Ellie, una joven adolescente 
  demasiado valiente y avispada para su edad, deben trabajar juntos para poder sobrevivir el viaje de un extremo a otro de los EE. UU.'
  ,'1','https://www.youtube.com/embed/W01L70IGBgE','admin@oss.com');

INSERT INTO videogame (idgame,routegame,front,downloads,classification,price,storageroute,genre,title,description,state,videourl,adminemail) 
VALUES (2,'http://pulsegames.com/videogames/2','front_2.jpg',0,'M',0,'game_2.tar','Acción','Tomb Raider',
  'Cuando una repentina tormenta destruye su barco de investigación, una joven e inexperta Lara Croft se encuentra varada en una isla 
  misteriosa y remota oculta en las costas de Japón. A pesar de varios signos de vida habitantes la isla es extrañamente desierta, y un 
  sentimiento de inquietud se instala con los sonidos extraños que salen de las sombras.
  Con sólo su determinación, fuerza interior, y el ingenio para ayudarla, Lara debe superar los desafíos de un viaje duro e implacable 
  que la llevará a través de un desierto, la jungla vasta y profunda y en tumbas subterráneas que te hacen sentir claustrofobia, amenaza y 
  miedo por el pasado de la isla.
  Mientras ella lucha por sobrevivir a través de combates brutales, Lara será llevado hasta sus a sus límites abrigándola a adaptarse a su 
  situación con el fin de sobrevivir y escapar de los depredadores letales que acechan todos sus movimientos.'
  ,'1','https://www.youtube.com/embed/N3HfmcDRbn8','admin@oss.com');

INSERT INTO videogame (idgame,routegame,front,downloads,classification,price,storageroute,genre,title,description,state,videourl,adminemail) 
VALUES (3,'http://pulsegames.com/videogames/3','front_3.png',0,'M',1000,'game_3.tar','Acción','Grand Theft Auto V',
  'Grand Theft Auto V para PlayStation®4, Xbox One y PC aprovechará al máximo la potencia de los sistemas y consolas de nueva generación 
  con mejoras de todo tipo, que incluyen resolución y detalle gráfico mejorados, tráfico más denso, mayor distancia visual, IA mejorada, 
  nueva fauna y efectos de daño y clima avanzados para crear la experiencia de mundo abierto suprema. 
  Los Santos: una extensa metrópolis bañada por el sol llena de gurús de autoayuda, aspirantes a estrellas y famosos en decadencia. 
  La que antes fuera la envidia del mundo occidental trata ahora de mantenerse a flote en una era de incertidumbre económica y realities 
  por cable baratos. En medio de esta confusión, tres criminales muy distintos lo arriesgan todo en una serie de audaces y peligrosos 
  golpes que podrían solucionarles la vida. '
  ,'1','https://www.youtube.com/embed/QkkoHAzjnUs','admin@oss.com');

INSERT INTO videogame (idgame,routegame,front,downloads,classification,price,storageroute,genre,title,description,state,videourl,adminemail) 
VALUES (4,'http://pulsegames.com/videogames/4','front_4.jpg',0,'M' ,599,'game_4.zip','Disparos','Halo 4',
  'Tras treinta años de guerra con el Covenant, la humanidad por fin logró la victoria. El Jefe Maestro, un supersoldado Spartan, y Cortana, 
  una inteligencia artificial con una sofisticación técnica incomparable, acabaron con el Covenant, los Flood y la amenaza de la Matriz de 
  Halo en una instalación remota conocida como el Arca. Ahora, tras el conflicto, el Jefe y Cortana vagan a la deriva por el espacio a bordo 
  de los restos de la Forward Unto Dawn, mientras se acercan lentamente a un misterioso mundo artificial que pronto llamarán Requiem.'
  ,'1','https://www.youtube.com/embed/ulLDTPJ_sWo','admin@oss.com');

INSERT INTO videogame (idgame,routegame,front,downloads,classification,price,storageroute,genre,title,description,state,videourl,adminemail)
VALUES (5,'http://pulsegames.com/videogames/5','front_5.jpg',0,'M',899,'game_5.tar','Disparos','CALL OF DUTY ADVANCED WARFARE',
  'Call of Duty Advanced Warfare se situará en el año 2054. Las compañías militares privadas o PMCs se encuentran en la cúspide de la 
  práctica militar a nivel mundial, ofreciendo sus servicios a distintas naciones sin importar las fronteras. Jonathan Irons (Kevin Spacey) 
  es el fundador de la PMC más grande de todas: “Atlas”. El mundo se encuentra en un estado crítico tras un ataque a gran escala, 
  descrito por Sledgehammer como un nuevo 11 de septiembre, por parte del grupo terrorista KVA. 
  El protagonista, el cabo Mitchell será un Marine de los Estados Unidos que se une a la PMC Atlas a petición del hijo de Jonathan Irons, 
  Will Irons. Se menciona que Mitchell será el único protagonista y que no hablará durante el juego, solo en las cutscenes.'
  ,'1','https://www.youtube.com/embed/sFu5qXMuaJU','admin@oss.com');

INSERT INTO videogame (idgame,routegame,front,downloads,classification,price,storageroute,genre,title,description,state,videourl,adminemail)
VALUES (6,'http://pulsegames.com/videogames/6','front_6.jpg',0,'E',0,'game_6.zip','Musical','Mario Party 10',
  'Es momento de la diversión con la evolución de los juegos de mesa de Nintendo con Mario Party, después de tantos años tenemos una nueva 
  versión para Wii U. 
  El detalle más importante será que podremos jugar 4 personajes los minijuegos, pero ahora Bowser será controlado por una quinta persona 
  por medio del gamepad para hacernos sufrir de una manera exagerada, aunque no será en todo momento.'
  ,'1','https://www.youtube.com/embed/L69Z39bgdU4','admin@oss.com');
