-- DATOS DE PRUEBA (primero las dimensiones y al final la tabla de hechos)

INSERT INTO Dim_Tiempo (SK_Tiempo, Fecha, Anio, Mes, Dia) VALUES
(20251110, '2025-11-10', 2025, 11, 10),
(20251205, '2025-12-05', 2025, 12,  5),
(20260112, '2026-01-12', 2026,  1, 12),
(20260209, '2026-02-09', 2026,  2,  9),
(20260316, '2026-03-16', 2026,  3, 16);

INSERT INTO Dim_Paciente (ID_Paciente_NK, Nombre, Edad, Provincia) VALUES
(1001, 'Ana Torres',    34, 'Pichincha'),
(1002, 'Luis Andrade',  58, 'Guayas'),
(1003, 'Marta Ruiz',     7, 'Azuay'),
(1004, 'Pedro Vega',    45, 'Manabí'),
(1005, 'Sofía León',    29, 'Tungurahua'),
(1006, 'Jorge Mena',    63, 'Pichincha');

INSERT INTO Dim_Medico (ID_Medico_NK, Nombre, Especialidad) VALUES
(201, 'Dr. Carlos Salazar',  'Cardiología'),
(202, 'Dra. Elena Proaño',   'Pediatría'),
(203, 'Dr. Mario Játiva',    'Medicina General'),
(204, 'Dra. Lucía Cabrera',  'Traumatología');

INSERT INTO Dim_Servicio (ID_Servicio_NK, Tipo_Servicio, Area) VALUES
(601, 'Consulta Externa', 'Ambulatorio'),
(602, 'Emergencia',       'Urgencias'),
(603, 'Telemedicina',     'Virtual');

INSERT INTO Fact_Consulta
(SK_Paciente, SK_Tiempo, SK_Medico, SK_Servicio, Costo_Consulta_USD, Duracion_Minutos) VALUES
(1, 20251110, 1, 1,  60.00, 30),
(2, 20251110, 1, 1,  60.00, 25),
(3, 20251205, 2, 1,  40.00, 20),
(4, 20251205, 3, 2,  90.00, 45),
(5, 20260112, 3, 1,  35.00, 20),
(6, 20260112, 1, 3,  45.00, 15),
(1, 20260209, 1, 1,  60.00, 35),
(3, 20260209, 2, 3,  30.00, 15),
(2, 20260209, 4, 2, 120.00, 60),
(4, 20260316, 4, 1,  70.00, 40),
(5, 20260316, 2, 1,  40.00, 25),
(6, 20260316, 3, 3,  25.00, 10);
