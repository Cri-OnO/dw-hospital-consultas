# Hospital: costo y duración de las consultas

Este proyecto guarda los datos de las consultas de un hospital en una base de datos de PostgreSQL y responde dos preguntas sobre ellas.

Integrantes: Christopher Freire, Diego Garcia y Andrés Gancino.

## Qué hace

Organiza la información del hospital en cinco tablas. Una tabla guarda cada consulta con su costo y su duración en minutos. Las otras cuatro guardan los detalles: el paciente, la fecha, el médico y el tipo de servicio.

Con esos datos responde dos preguntas:

1. Cuánto dinero se cobró por cada especialidad médica en cada año.
2. Cuántos minutos dura una consulta en promedio, según el tipo de servicio y el mes.

## Qué hay en la carpeta

- `sql/01_esquema_hospital.sql` crea las tablas.
- `sql/02_datos_prueba.sql` llena las tablas con datos de ejemplo.
- `sql/03_consultas.sql` contiene las dos preguntas.

## Cómo se usa

1. En pgAdmin 4 crea una base de datos llamada `db_hospital_uti`.
2. Abre el Query Tool en esa base.
3. Ejecuta con F5 el archivo `01_esquema_hospital.sql` y después `02_datos_prueba.sql`, una sola vez cada uno.
4. Abre `03_consultas.sql`, selecciona una pregunta y pulsa F5. Repite con la otra.

Los datos son inventados y sirven solo para practicar.
