-- Asi se crea una base de datos
CREATE DATABASE practicas;

USE practicas;

-- ahora procedemos a crear nuestra primeraa tabla
-- Tipos de datos: https://dev.mysql.com/doc/refman/8.0/en/data-types.html
-- AUTO_INCREMENT > solamente puede haber uno por tabla
CREATE TABLE usuarios(
-- nombre datatype [con adicionales]
	id INT auto_increment unique primary KEY,
    nombre text not null,
    dni char(8) unique
);