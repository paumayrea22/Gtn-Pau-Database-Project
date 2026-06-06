# Sistema de Gestión de Datos - Gym_Pau

Este repositorio contiene el núcleo de almacenamiento de datos para la aplicación de gestión del complejo deportivo `gym_pau`. El proyecto abarca desde el diseño relacional robusto hasta la migración hacia un enfoque documental no relacional, resolviendo la persistencia de datos solicitada en el ciclo intermodular de 1.º de DAM.

---

## 📊 1. Arquitectura Relacional (MySQL)

El diseño cuenta con un total de 22 tablas optimizadas, fundamentadas en el modelo entidad-relación mejorado que soporta las siguientes características avanzadas de integridad:

* **Modelado de Herencia 1:1:** Implementada estrictamente mediante restricciones de clave foránea aplicadas a la tabla generalizadora `Usuarios` (40 filas exactas), dividida equitativamente entre 20 registros exclusivos para `Empleados` y 20 para `Clientes`.
* **Especialización de Entidades:** Estructura modular para el flujo de facturación mediante la división de la herencia de `Pagos` en subtablas físicas de transacciones independientes: `Tarjetas`, `Efectivos` y `Transferencias`.
* **Garantía de Idempotencia:** El script de inserción masiva (`inserts.sql`) incorpora un bloque de control inicial automatizado mediante el uso de comandos `TRUNCATE TABLE` precedidos por la directiva `SET FOREIGN_KEY_CHECKS = 0;`. Esto permite la ejecución infinita del script de pruebas sin generar conflictos por registros duplicados o violaciones de claves foráneas.

---

## 🍃 2. Arquitectura Documental (MongoDB)

Para responder a necesidades de escalabilidad y esquemas flexibles, se realizó una migración estratégica de las tablas fuertemente vinculadas `Gimnasios` y `Salas` hacia un paradigma NoSQL.

* **Estrategia de Relación:** Se aplicó un modelo de **relación por referencias directas** (`One-to-many amb referències`) inyectando manualmente el campo `Gimnasio_id_gimnasio` dentro de los documentos hijos de la colección `salas`.
* **Consistencia de Identificadores:** Se desestimó el uso de IDs autogenerados por el motor (`ObjectId`) a favor de identificadores numéricos fijos controlados (`_id`), asegurando una compatibilidad semántica perfecta con los históricos del backend relacional.

---

## 📈 3. Consultas de Explotación e Informes Analíticos

El sistema cuenta con 5 informes analíticos optimizados para el control directivo del centro. Siguiendo las buenas prácticas académicas, las consultas se estructuran mediante **alias implícitos de tabla** (omitiendo la palabra clave `AS`) y realizan la ordenación en el `ORDER BY` directamente sobre los alias calculados para optimizar el rendimiento de la base de datos:

1.  **Ranking de ventas de productos:** Suma acumulada de unidades vendidas (`SUM`) agrupadas por artículo y ordenadas de menor a mayor.
2.  **Disponibilidad de sesiones diarias:** Cuadrante horario dinámico filtrado por fecha (`WHERE`) con cálculo en tiempo real de plazas libres.
3.  **Control de vencimientos:** Alerta de caducidad inminente de contratos para la fidelización de clientes.
4.  **Resumen financiero de recaudación:** Agrupación analítica de ingresos colapsada por método de pago (`Tarjeta`, `Efectivo`, `Transferencia`).
5.  **Carga operativa de monitores:** Conteo agregativo (`COUNT`) de sesiones asignadas por empleado para la gestión equitativa de recursos humanos.
