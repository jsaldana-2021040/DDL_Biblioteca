-- José Roberto Saldaña Arrazola --
-- Codigo tecnico: IN5BM --
-- Grupo: 2 --

CREATE DATABASE IF NOT EXISTS biblioteca 
DEFAULT CHARACTER SET utf8 
DEFAULT COLLATE utf8_general_ci;

USE biblioteca;

DROP TABLE IF EXISTS prestamos;
DROP TABLE IF EXISTS libros;
DROP TABLE IF EXISTS socios;
DROP TABLE IF EXISTS temas;
DROP TABLE IF EXISTS editoriales;
DROP TABLE IF EXISTS autores;
DROP TABLE IF EXISTS actualizaciones_libros;

CREATE TABLE autores (
	id INT NOT NULL AUTO_INCREMENT,
	nombre_autor VARCHAR(60) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE editoriales (
	id INT NOT NULL AUTO_INCREMENT,
	nombre_editorial VARCHAR(30) NOT NULL,
	direccion VARCHAR (100) NOT NULL,
	telefono VARCHAR (15) NOT NULL, 
 	PRIMARY KEY (id)
);

CREATE TABLE temas (
	id INT NOT NULL AUTO_INCREMENT,
	Nombre_tema VARCHAR(30) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE socios (
	id INT NOT NULL AUTO_INCREMENT,
	nombre_completo VARCHAR(60) NOT NULL,
	direccion VARCHAR(100) NOT NULL,
	correo VARCHAR(25) NULL DEFAULT 'Sin correo',
	telefono VARCHAR(15) NOT NULL,
	foto VARCHAR(20) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE Libros (
	id INT NOT NULL AUTO_INCREMENT,
	isbn VARCHAR(20) NOT NULL UNIQUE,
	titulo VARCHAR(65) NOT NULL,
	numero_ejemplar TINYINT NOT NULL,
	autor_id INT NOT NULL,
	editorial_id INT NOT NULL,
	tema_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (autor_id) REFERENCES autores (id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (editorial_id) REFERENCES editoriales (id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (tema_id) REFERENCES temas (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE prestamos (
	id INT NOT NULL AUTO_INCREMENT,
	fecha_prestamo DATE NOT NULL,
	fecha_entrega DATE NOT NULL,
	socio_id INT NOT NULL,
	libro_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (socio_id) REFERENCES socios (id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (libro_id) REFERENCES Libros (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE actualizaciones_libros (
	isbn_anterior VARCHAR(20) NOT NULL,
	titulo_anterior VARCHAR(65) NOT NULL,
	numero_ejemplar_anterior TINYINT NOT NULL,
	isbn_nuevo VARCHAR(20) NOT NULL,
	titulo_nuevo VARCHAR(65) NOT NULL,
	numero_ejemplar_nuevo TINYINT NOT NULL,
	usuario VARCHAR(15) NOT NULL,
	fecha_modificacion DATETIME NOT NULL
);