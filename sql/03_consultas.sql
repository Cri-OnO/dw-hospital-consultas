-- EJECUTAR UNA CONSULTA A LA VEZ: seleccione el texto de una y presione F5

-- Consulta 1: Costo total de consultas por especialidad medica y anio
SELECT me.Especialidad,
       t.Anio,
       SUM(f.Costo_Consulta_USD) AS Costo_Total_USD
FROM Fact_Consulta f
JOIN Dim_Medico me ON f.SK_Medico = me.SK_Medico
JOIN Dim_Tiempo t  ON f.SK_Tiempo = t.SK_Tiempo
GROUP BY me.Especialidad, t.Anio
ORDER BY me.Especialidad, t.Anio;

-- Consulta 2: Duracion promedio de las consultas por tipo de servicio y mes
SELECT s.Tipo_Servicio,
       t.Mes,
       ROUND(AVG(f.Duracion_Minutos), 2) AS Duracion_Promedio_Min
FROM Fact_Consulta f
JOIN Dim_Servicio s ON f.SK_Servicio = s.SK_Servicio
JOIN Dim_Tiempo t   ON f.SK_Tiempo   = t.SK_Tiempo
GROUP BY s.Tipo_Servicio, t.Mes
ORDER BY s.Tipo_Servicio, t.Mes;
