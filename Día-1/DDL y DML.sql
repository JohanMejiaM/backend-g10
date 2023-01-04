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
	
SELECT * FROM tareas WHERE usuario_id=1;