INSERT INTO student (studentemail,name,lastname1,lastname2,accountnumber,career,password,status,credits,history)
VALUES ('eduardomiranda@ciencias.unam.mx','Eduardo','Miranda','Sanchez','309199814','CC.','pato','c',0,'ruta');

INSERT INTO admin (adminemail,name,lastname1,lastname2,emailcontact,phone,password)
VALUES ('eduardomiranda@ciencias.unam.mx','Eduardo','Miranda','Sanchez','patito@pato.com','5531514009','pass');

INSERT INTO loan (studentemail,adminemail,date,status,creditapproved)
VALUES ('eduardomiranda@ciencias.unam.mx','eduardomiranda@ciencias.unam.mx','2001-10-05','n',0);

INSERT INTO student (studentemail,name,lastname1,lastname2,accountnumber,career,password,status,credits,history)
VALUES ('pedro@banana.mx','Pedro','Banana','Micon','309199815','CC.','mono','c',0,'ruta');

INSERT INTO loan (studentemail,adminemail,date,status,creditapproved)
VALUES ('pedro@banana.mx','eduardomiranda@ciencias.unam.mx','2001-10-05','n',0);

select s.studentemail,s.name, s.lastname1,s.lastname2,s.accountnumber, s.career,s.history from loan as p JOIN student as s ON p.studentemail=s.studentemail where s.status like 'n';

update student set history = '123.pdf';