CREATE DATABASE Horarios;

USE Horarios;

CREATE TABLE Estudiantes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL
);

CREATE TABLE Docente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL 
);

CREATE TABLE Aula (
    id INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE Hora (
    id INT PRIMARY KEY AUTO_INCREMENT,
    hora TIME NOT NULL UNIQUE
);

CREATE TABLE Curso (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    id_Docente INT,
    FOREIGN KEY (id_Docente) REFERENCES Docente(id)
);

CREATE TABLE Franja_Horaria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_hora_inicio INT,
    id_hora_fin INT,
    FOREIGN KEY (id_hora_inicio) REFERENCES Hora(id),
    FOREIGN KEY (id_hora_fin) REFERENCES Hora(id),
    CHECK (id_hora_fin >= id_hora_inicio),
    UNIQUE (id_hora_inicio, id_hora_fin)
);

CREATE TABLE Dia (
    id INT PRIMARY KEY AUTO_INCREMENT,
    dia VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Horario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_dia INT,
    id_Franja_Horaria INT,
    FOREIGN KEY (id_dia) REFERENCES Dia(id),
    FOREIGN KEY (id_Franja_Horaria) REFERENCES Franja_Horaria(id), 
    UNIQUE (id_dia, id_Franja_Horaria)
);

CREATE TABLE Clase (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_Curso INT,
    id_Horario INT,
    id_Aula INT,
    FOREIGN KEY (id_Curso) REFERENCES Curso(id),
    FOREIGN KEY (id_Horario) REFERENCES Horario(id),
    FOREIGN KEY (id_Aula) REFERENCES Aula(id)
);

CREATE TABLE Estudiantes_Clase (
    id_Estudiante INT,
    id_Curso INT,
    PRIMARY KEY (id_Estudiante, id_Curso),
    FOREIGN KEY (id_Estudiante) REFERENCES Estudiantes(id),
    FOREIGN KEY (id_Curso) REFERENCES Curso(id)
);
