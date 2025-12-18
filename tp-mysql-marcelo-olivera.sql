-- -Ejercicio 1
CREATE DATABASE veterinaria_patitas_felices;
-- Ejercicio 2
CREATE TABLE duenos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(100)
);
-- Ejercicio 3
CREATE TABLE mascotas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(30) NOT NULL,
    fecha_nacimiento DATE,
    id_dueno INT,
    FOREIGN KEY(id_dueno) REFERENCES duenos(id)
);
-- -Ejercicio 4
CREATE TABLE veterinarios(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    especialidad VARCHAR(50) NOT NULL
);
-- -Ejercicio 5
CREATE TABLE historial_clinico(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_mascota INT,
    id_veterinario INT,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    descripcion VARCHAR(250) NOT NULL,
    FOREIGN KEY(id_mascota) REFERENCES mascotas(id) ON DELETE CASCADE,
    FOREIGN KEY(id_veterinario) REFERENCES veterinarios(id)
);
-- -Ejercicio 6
INSERT INTO duenos (
        nombre,
        apellido,
        telefono,
        direccion
    )
VALUES (
        'Juan',
        'Perez',
        '1144337766',
        'Calle falsa 123'
    ),
    (
        'Jose',
        'Martinez',
        '1144337788',
        'Calle falsa 124'
    ),
    (
        'Julio',
        'Villanueva',
        '1144337711',
        'Calle falsa 126'
    );
INSERT INTO mascotas (
        nombre,
        especie,
        fecha_nacimiento,
        id_dueno
    )
VALUES (
        'Jhon',
        'Pitbull',
        '2024-01-15',
        1
    ),
    (
        'Pepito',
        'Chiwawa',
        '2024-01-15',
        2
    ),
    (
        'Kyler',
        'Pitbull',
        '2024-01-15',
        3
    );
INSERT INTO veterinarios (
        nombre,
        apellido,
        matricula,
        especialidad
    )
VALUES (
        'Ricardo',
        'Ford',
        '3120',
        'Clínica general'
    ),
    (
        'Zaira',
        'Nara',
        '6894',
        'Cirugía'
    );
INSERT INTO historial_clinico(
        id_mascota,
        id_veterinario,
        fecha_registro,
        descripcion
    )
VALUES (
        1,
        1,
        '2024-01-15 10:30:00',
        'Tiene moquillo'
    ),
    (
        3,
        1,
        '2024-01-15 10:30:00',
        'Necesita medicamentos'
    ),
    (
        2,
        2,
        '2024-01-15 10:30:00',
        'Necesita operacion'
    );
-- -Ejercicio 7
UPDATE duenos
SET direccion = 'Calle Verdadera 123'
WHERE id = 1;
UPDATE veterinarios
SET especialidad = 'Cirugia'
WHERE id = 1;
UPDATE historial_clinico
SET descripcion = 'Este perro esta muy bien'
WHERE id = 1;
-- -Ejercicio 8
DELETE FROM mascotas
WHERE id = 2;
-- -Ejercicio 9
SELECT m.nombre AS nombre_mascota,
    m.especie AS especie_mascota,
    CONCAT(d.nombre, ' ', d.apellido) AS nombre_completo_dueno
FROM mascotas m
    INNER JOIN duenos d ON d.id = m.id_dueno;
-- -Ejercicio 10
SELECT m.nombre AS nombre_mascota,
    m.especie AS especie_mascota,
    CONCAT(d.nombre, ' ', d.apellido) AS nombre_completo_dueno,
    CONCAT(v.nombre, ' ', v.apellido) AS nombre_completo_veterinario,
    h.fecha_registro,
    h.descripcion
FROM historial_clinico h
    INNER JOIN veterinarios v ON v.id = h.id_veterinario
    INNER JOIN mascotas m ON m.id = h.id_mascota
    INNER JOIN duenos d ON d.id = m.id_dueno;