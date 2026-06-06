USE gym_pau;

-- 1. INFORME DE VENTAS DE PRODUCTOS (ORDENADOS DE MENOR A MAYOR) --
SELECT p.descripcion, SUM(pp.cantidad) Total_Vendido
FROM Productos p
JOIN Pedidos_Productos pp ON p.id_producto = pp.Producto_id_producto
GROUP BY p.id_producto
ORDER BY Total_Vendido ASC;

-- 2. DISPONIBILIDAD DE SESIONES EN UN DÍA DETERMINADO --
SELECT se.hora_inicio, a.nombre Actividad, sa.nombre Sala, se.plazas_libres
FROM Sesiones se
JOIN Actividades a ON se.Actividad_id_actividad = a.id_actividad
JOIN Salas sa ON se.Sala_id_sala = sa.id_sala
WHERE se.fecha = '2024-03-01'
ORDER BY se.hora_inicio ASC;

-- 3. CONTROL DE VENCIMIENTOS DE SOCIOS (ORDENADO POR CADUCIDAD) --
SELECT u.nombre, u.apellidos, s.fecha_fin Vencimiento
FROM Usuarios u
JOIN Clientes c ON u.id_usuario = c.id_usuario
JOIN Suscripciones s ON c.id_usuario = s.Cliente_id_usuario
ORDER BY Vencimiento ASC;

-- 4. TOTAL RECAUDADO POR CADA MÉTODO DE PAGO --
SELECT p.metodo, SUM(p.importe) Recaudacion
FROM Pagos p
GROUP BY p.metodo
ORDER BY Recaudacion DESC;

-- 5. CARGA DE TRABAJO POR CADA MONITOR --
SELECT u.nombre, u.apellidos, COUNT(s.id_sesion) Numero_Sesiones
FROM Usuarios u
JOIN Empleados e ON u.id_usuario = e.id_usuario
JOIN Sesiones s ON e.id_usuario = s.Empleado_id_usuario
GROUP BY u.id_usuario
ORDER BY Numero_Sesiones DESC;