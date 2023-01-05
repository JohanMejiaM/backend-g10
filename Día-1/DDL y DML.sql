USE practicas;

CREATE TABLE tareas (
	id 				INT AUTO_INCREMENT PRIMARY KEY,
    titulo 			VARCHAR(100) UNIQUE,
    descripcion 	TEXT,
    usuario_id 		INT,
    -- CREO LA RELACION ENTRE LAS TABLAS
    -- indico entre parentesis la columna de esta tabla yluego la tabla ( su columna)
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- SUB LENGUAJES
-- DDL (Data Definition Language)
-- Es un lenguaje que sirve para definir estructuras de datos ( crear bd, crear tablas,
-- actualizar tablas, eliminar tablas)
-- CREATE (Crear)
-- ALTER (Actualizar)
-- DROP (Eliminar) eliminar absolutamente TODO

-- DML (Data Manipulation Language)
-- Es un lenguaje que sirve para deifinir la información que irá dentro de las estructuras
-- Insertar datos, actualizar datos, eliminar datos y leer datos
-- INSERT (Insertar)
-- SELECT (Visualizar)
-- UPDATE (Actualizar)
-- DELETE (Eliminar)
INSERT INTO usuarios (nombre, dni) VALUES ('Eduardo','73500749');

-- Si queremos utilizar el valor por defecto de una columna se utiliza DEFAULT
INSERT INTO usuarios (id, nombre, dni) VALUES (DEFAULT, 'Juana','75486247');

INSERT INTO usuarios (id, nombre, dni) VALUES (DEFAULT, 'Roberto','34567895'),
												(DEFAULT, 'Maria','65287942'),
												(DEFAULT, 'Roxana','45786587');

INSERT INTO tareas (id, titulo, descripcion, usuario_id) VALUES 
(DEFAULT, 'ir a la playa','ire a la playa el fin de semana',1),
(DEFAULT, 'ir a la piscina','ire a la piscina a mis clases de natacion',3);

-- Visualizar la informacion
SELECT nombre, dni, id, id FROM usuarios;

-- Visualizar la totalidad de las columnas
SELECT * FROM usuarios;

INSERT INTO usuarios (id, nombre, dni) VALUES (DEFAULT, 'Juana', '33265946'),
												(DEFAULT, 'Maria', '56478924');
                                                
-- SELECCIONA TODAS LAS COLUMNAS DE LA TABLA USUARIOS CUYO nombre SEA Juana
SELECT * FROM usuarios WHERE nombre='Juana' AND id=3;

-- Visualizar todas las tareas del usuario 1 Y/O del usuario 2
SELECT * FROM tareas WHERE usuario_id=1 or usuario_id=2;

INSERT INTO tareas (id, titulo, descripcion, usuario_id) VALUES (DEFAULT, 'Ir a comer', 'Comer un sabroso pollito a la brasa', 1),
                                                                (DEFAULT, 'Comer pizza', 'Comer una sabrosa pizza con peperoni', 1);

-- Buscar una palabra o palabras dentro de un texto	
SELECT * FROM tareas WHERE usuario_id=1 AND titulo LIKE '%comer%';
SELECT * FROM usuarios WHERE nombre LIKE '%o';
SELECT * FROM usuarios WHERE nombre LIKE 'J%';
-- Si queremos hacer la distincion entre mayus y minus entonces antes de poner el texto colocaremos la palabra
-- BINARY y esto sirbe para que haga la comparacion a nivel de numeros de caracteres (formatos ASCII)
SELECT * FROM usuarios WHERE nombre LIKE BINARY 'j%';

-- _ > indico cuantos caracteres debe de 'saltar' para que busque el caracter indicado
SELECT * FROM usuarios WHERE nombre LIKE '_u%';

SELECT * FROM usuarios WHERE nombre NOT LIKE '__u%';

SELECT * FROM tareas;

-- Ahora insertamos una tarea sin dueño
INSERT INTO tareas (id, titulo,descripcion, usuario_id) VALUES
					(DEFAULT, 'Jugar LOL','Jugar con mis amigos pros',3);

SELECT * FROM tareas;

INSERT INTO tareas (id, titulo,descripcion, usuario_id) VALUES (DEFAULT, 'no hacer nada','no hacer nada porque tengo flojera');

-- Interseccion entre la tabla usuarios con la tabla tareas donde usuarios.id = tareas.usuario_id
SELECT * FROM usuarios INNER JOIN tareas ON usuarios.id = tareas.usuario_id;

SELECT * FROM usuarios LEFT JOIN tareas ON usuarios.id = tareas.usuario_id;

SELECT * FROM usuarios RIGHT JOIN tareas ON usuarios.id = tareas.usuario_id;

-- FULL OUTER JOIN
-- Selecciona todos los usuarios aun asi no tengan tareas y todas las tareas aun asi no tengan usuarios
-- hace una mezcla completa entre los usuarios y las tareas respetando sus conexiones
SELECT * FROM usuarios LEFT JOIN tareas ON usuarios.id = tareas.usuario_id UNION
SELECT * FROM usuarios RIGHT JOIN tareas ON usuarios.id = tareas.usuario_id;

-- UNION mezcla o combina las dos o mas consultas en una sola 'tabla virtual' pero estas consultas tienen
-- que tener el mismo numero de columnas, sino el uion sera incorrecto
SELECT nombre FROM usuarios UNION
SELECT titulo FROM tareas;

-- CONCATENAR > juntar combinar
SELECT CONCAT(titulo, ' ', descripciousuariosn) AS 'nombre completos' FROM tareas;

-- EJERCICIOS
-- 1. Devolver todos los usuarios cuyo dni contengan el numero 5
SELECT * FROM usuarios WHERE dni LIKE '%5%';
-- 2. Devolver todos los usuarios cuyo dni tengan el tercer digito 8
SELECT * FROM usuarios WHERE dni LIKE '___8%';
-- 3. Devolver todas las tareas del usuario 'Eduardo'
SELECT * FROM usuarios INNER JOIN tareas ON usuarios.id = tareas.usuario_id WHERE nombre='Eduardo';