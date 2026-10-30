-- ============================================================
-- BASE DE DATOS: db_hospital_uti
-- ESQUEMA: DIMENSIONAL (ESTRELLA) - CASO 2: HOSPITAL
-- ============================================================

-- 1. DIMENSION PACIENTE
CREATE TABLE Dim_Paciente (
    SK_Paciente SERIAL PRIMARY KEY,        -- Surrogate Key
    ID_Paciente_NK INT NOT NULL,           -- Natural Key (sistema operacional)
    Nombre VARCHAR(100) NOT NULL,
    Edad INT NOT NULL,
    Provincia VARCHAR(50) NOT NULL
);

-- 2. DIMENSION TIEMPO
CREATE TABLE Dim_Tiempo (
    SK_Tiempo INT PRIMARY KEY,             -- Formato YYYYMMDD (Ej: 20260112)
    Fecha DATE NOT NULL,
    Anio INT NOT NULL,
    Mes INT NOT NULL,
    Dia INT NOT NULL
);

-- 3. DIMENSION MEDICO
CREATE TABLE Dim_Medico (
    SK_Medico SERIAL PRIMARY KEY,
    ID_Medico_NK INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Especialidad VARCHAR(60) NOT NULL
);

-- 4. DIMENSION SERVICIO
CREATE TABLE Dim_Servicio (
    SK_Servicio SERIAL PRIMARY KEY,
    ID_Servicio_NK INT NOT NULL,
    Tipo_Servicio VARCHAR(60) NOT NULL,
    Area VARCHAR(60) NOT NULL
);

-- 5. TABLA DE HECHOS: FACT_CONSULTA
CREATE TABLE Fact_Consulta (
    -- Claves foraneas (claves sustitutas)
    SK_Paciente INT NOT NULL,
    SK_Tiempo INT NOT NULL,
    SK_Medico INT NOT NULL,
    SK_Servicio INT NOT NULL,

    -- Metricas
    Costo_Consulta_USD NUMERIC(10, 2) NOT NULL,
    Duracion_Minutos INT NOT NULL,

    -- Clave primaria compuesta
    CONSTRAINT PK_Fact_Consulta PRIMARY KEY (SK_Paciente, SK_Tiempo, SK_Medico, SK_Servicio),

    -- Integridad referencial
    CONSTRAINT FK_Consulta_Paciente FOREIGN KEY (SK_Paciente) REFERENCES Dim_Paciente(SK_Paciente),
    CONSTRAINT FK_Consulta_Tiempo   FOREIGN KEY (SK_Tiempo)   REFERENCES Dim_Tiempo(SK_Tiempo),
    CONSTRAINT FK_Consulta_Medico   FOREIGN KEY (SK_Medico)   REFERENCES Dim_Medico(SK_Medico),
    CONSTRAINT FK_Consulta_Servicio FOREIGN KEY (SK_Servicio) REFERENCES Dim_Servicio(SK_Servicio)
);

-- 6. INDICES PARA CONSULTAS ANALITICAS
CREATE INDEX IX_Fact_Consulta_Tiempo ON Fact_Consulta(SK_Tiempo);
CREATE INDEX IX_Fact_Consulta_Medico ON Fact_Consulta(SK_Medico);
CREATE INDEX IX_Fact_Consulta_Servicio ON Fact_Consulta(SK_Servicio);
