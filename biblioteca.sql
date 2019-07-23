create database Biblioteca;

use Biblioteca;

create table usuario(
	idUser int primary key auto_increment,
	nombre varchar(50),
    apellidos varchar(100),
	direccion varchar(200),
	celular char(9),
	email varchar(60)
);
create table genero(
	idGenero int primary key auto_increment,
	descripcion varchar(100)
);
create table autor(
	idAutor int primary key auto_increment,
	nom_autor varchar(100)
);
create table libro(
	idLibro int primary key auto_increment,
	titulo varchar(200),	
	id_genero int , 
    id_autor int,
	editorial varchar(50),
	stock int,
    año_publicacion int,
    estado varchar(10),
    foreign key(id_genero)references genero(idGenero),
	foreign key(id_autor)references autor(idAutor)
);

create table prestamo(
	idPrestamo int primary key auto_increment,
    id_usuario int,
    id_libro int,
	fechaPrestamo varchar(10),
    fechaEntrega varchar(10),
  	foreign key(id_usuario)references usuario(idUser),
	foreign key(id_libro)references libro(idLibro)  
);

/*Procedimiento para registrar Prestamo*/
create procedure Prestamos
(in id_usuario int,in id_libro int)
insert into prestamo values(null,id_usuario,id_libro,curdate(),adddate(curdate(),interval 5  day));
call Prestamos(1,1);/*LLamando Procedimiento para Prestamo*/
select*from historial;
/*Formato fecha en string*/
SELECT DATE_FORMAT(curdate(), '%W %M %Y');

/*Procedimiento para el filtrado de libro por el ID*/
create procedure FiltrarLibro(in id_libro int)
select nom_autor,nombre,titulo,idLibro,idUser,fechaPrestamo,fechaEntrega 
from libro inner join autor on libro.id_autor=autor.idAutor 
inner join prestamo on prestamo.id_libro=libro.idLibro inner join usuario on 
usuario.idUser=prestamo.id_user where idLibro=id_libro;

/*Procedimiento De listado por prestado de libros*/
create procedure listarPrestados
()
select nom_autor,nombre,titulo,idPrestamo,DATE_FORMAT(fechaEntrega, '%d de %b del %Y') as entrega
from libro inner join autor on libro.id_autor=autor.idAutor 
inner join prestamo on prestamo.id_libro=libro.idLibro 
inner join usuario on usuario.idUser=prestamo.id_usuario order by idPrestamo;

/*Select por like*/
select nom_autor,nombre,titulo,idPrestamo,fechaEntrega 
from libro inner join autor on libro.id_autor=autor.idAutor 
inner join prestamo on prestamo.id_libro=libro.idLibro
 inner join usuario on usuario.idUser=prestamo.id_user where nombre LIKE'%deyvi%';

/*Procedimiento De listado por prestado de libros*/
create procedure listarLibros()
select idLibro,titulo,estado,g.descripcion,a.nom_autor,
editorial,año_publicacion,estado,stock,año_publicacion
from genero g inner join libro l on l.id_genero=g.idGenero
inner join autor a on a.idAutor=l.id_autor order by idLibro;



create procedure listarPorId(in id int)
select idLibro,titulo,estado,nom_autor,titulo,curdate() as prestamo,
adddate(curdate(),interval 5 day) as entrega 
from libro inner join autor on libro.id_autor=autor.idAutor where idLibro=id;

call listarPorId(1);

/*--------------------------------------------*/;
insert into usuario values(null,'deyvi','mauricio magno','Mz a lt 14',912015475,'deyvi.sam@hotmail.com');
insert into usuario values(null,'LUIS','ojead magno','Mz a lt 14',912015475,'deyvi.sam@hotmail.com');
insert into genero(descripcion)values('Terror'), ('Novela'),('Comedia'),('Drama');

insert into autor(nom_autor)values('Ricardo Palma'), ('Cesar Vallejo'),('José Maria Arguedas'),('Mario Vargas llosa');
truncate table libro;
insert into libro(titulo,id_genero,id_autor,editorial,stock,año_publicacion,estado)values
							('Despertar de los muertos',1,1,'Los panchos',4,year(now()),'Disponible'), 
							('Rubi y yo',2,2,'Panini',2,year(now()),'Disponible'),
							('Mi abulo vino de visita',3,3,'Nose',4,year(now()),'Disponible'),
                            ('Gallo Carmelo',3,1,'Los Pollos',5,1999,'Disponible'),
							('Viñetas del Mar',1,3,'American',1,2012,'Disponible');

create table historial(
	idHistorial int auto_increment primary key,
    fecha datetime,
    id_libro int,
    id_usuario int,
    foreign key(id_libro)references libro(idLibro),
    foreign key(id_usuario)references usuario(idUser)
);
create trigger insertPrestamo
after insert on prestamo
for each row
insert into historial(fecha,id_libro,id_usuario) values(now(),new.id_libro,new.id_usuario);

