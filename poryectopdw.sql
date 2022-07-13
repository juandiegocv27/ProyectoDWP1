DROP SCHEMA cineflex;
DROP USER usuario_cine;


CREATE SCHEMA cineflex;

CREATE USER 'usuario_cine'@'%' IDENTIFIED BY 'cinefilo';
GRANT ALL PRIVILEGES ON  cineflex.* to 'usuario_cine';
flush privileges;

Create table cineflex.cine(
id_cine INT NOT NULL AUTO_INCREMENT, 
cartelera VARCHAR(30) NOT NULL, 
historial VARCHAR(50) NOT NULL,
PRIMARY KEY (id_cine));

CREATE TABLE cineflex.pelicula (
  id_pelicula INT NOT NULL AUTO_INCREMENT,
  precio double,
  categoria VARCHAR(30) NOT NULL,
critica VARCHAR(30) NOT NULL,
  idiomas VARCHAR(30) NOT NULL,
  PRIMARY KEY (id_pelicula),
  foreign key fk_cine_pelicula (id_cine) references cine(id_cine));
  
  create table cineflex.actualizarr (
  id_actualizar INT NOT NULL AUTO_INCREMENT,
  fecha VARCHAR(30) NOT NULL,  
  peliculas VARCHAR(30) NOT NULL,
  carteleras VARCHAR(30) NOT NULL,
  PRIMARY KEY (id_actualizar),
  foreign key fk_actualizar_pelicula (id_pelicula) references pelicula(id_pelicula),
  foreign key fk_actualizar_cine (id_cine) references cine(id_cine));
  
  create table cineflex.venta (
  id_venta INT NOT NULL AUTO_INCREMENT,
  id_factura INT NOT NULL,
  id_pelicula INT NOT NULL,
  id_comida INT NOT NULL,
  precio double, 
  cantidad int,
  PRIMARY KEY (id_venta),
  foreign key fk_ventas_cine (id_cine) references cine(id_cine)
);

insert into cineflex.cine(id_cine,cartelera,historial) values
(5,noche,treintaopciones),
(5,dia,cuarentaopciones),
(5,noche,ochoopciones);

insert into cineflex.pelicula(id_pelicula,precio,categoria,critica,idiomas) values
(5055,5.000,horror,buena,españollatino),
(4029,5.200,comedia,mala,ingles),
(5232,5.600,suspenso,excelente,españollatino);

insert into cineflex.actualizarr(id_actualizar,fecha,peliculas,carteleras) values
(111,cuatro/julio/dosmilveintidos,cuarenta,noches),
(1101,cuatro/julio/dosmilveintidos,cuarenta,dias),
(1011,cuatro/julio/dosmilveintidos,cuarenta,mañanas);

insert into cineflex.venta(id_venta,id_factura,id_pelicula,id_comida,precio,cantidad) values
(5,12323,5055,5454,5.453,2),
(14,13214,4029,2322,5.453,1),
(23,34232,5055,1231,10.003,3);
  

