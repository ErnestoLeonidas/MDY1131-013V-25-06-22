ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YY';

-- Borrar las tablas
    -- de adentro a fuera
DROP TABLE Reservas_Acompanante;
DROP TABLE Acompanantes;
DROP TABLE Reservas;


-- creacion de tablas
CREATE TABLE Reservas_Acompanante (
    numero_reserva      NUMBER NOT NULL,
    rut_acompanante     NUMBER(11) NOT NULL
);

CREATE TABLE Acompanantes (
    rut_acompanante     NUMBER(11) NOT NULL,
    dv                  CHAR(1) NOT NULL,
    nombres             VARCHAR(250) NOT NULL,
    apellido_paterno    VARCHAR(250) NOT NULL,
    apellido_materno    VARCHAR(250),
    fecha_nacimiento    DATE NOT NULL
);

CREATE TABLE Reservas (
    numero_reserva      NUMBER NOT NULL,
    fecha_reserva       DATE NOT NULL
);

-- 2. creo las claves primarias
ALTER TABLE Reservas ADD CONSTRAINT reservas_PK PRIMARY KEY (numero_reserva);
ALTER TABLE Acompanantes ADD CONSTRAINT acompanantes_PK PRIMARY KEY (rut_acompanante);

ALTER TABLE Reservas_Acompanante ADD CONSTRAINT reservas_acompanantes_PK
    PRIMARY KEY (numero_reserva,rut_acompanante);

-- 3. creo las foraneas
ALTER TABLE Reservas_Acompanante ADD CONSTRAINT 
    reservas_acompanante_numero_reserva_FK FOREIGN KEY (numero_reserva)
    REFERENCES Reservas (numero_reserva);

ALTER TABLE Reservas_Acompanante ADD CONSTRAINT
    reservas_acompanante_rut_acompanante_FK FOREIGN KEY (rut_acompanante)
    REFERENCES Acompanantes (rut_acompanante);


-- Insert a las tablas
-- se insertan primero datos en las tablas que no tienen claves foraneas
-- a las que si las poseen

-- Los NUMBER van con numeros
-- los VARCHAR van entre comillas simples
-- los CHAR van entre comillas simples
-- los DATE van entre comillas simples pero se debe indicar el formato
    -- el formato de los DATE se indica arriba antes de todo.
    -- ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YY';
    
INSERT INTO Acompanantes VALUES (12345678912,'K','Juanito','Acuña','Mesa','25/06/97');

INSERT INTO Reservas VALUES (1, '25/06/22');

INSERT INTO Reservas_Acompanante VALUES (1, 12345678912);
    
