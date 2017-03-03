--para ver qué tabla contiene la columna buscada
SELECT 
c.name AS ColName, 
t.name AS TableName
FROM sys.columns c
JOIN sys.tables t ON c.object_id = t.object_id
WHERE c.name LIKE '%TablaDimensionID'

--para buscar tablas
SELECT 
t.name AS TableName
FROM sys.tables t
WHERE 
t.name LIKE '%dimension%'

--para ver qué columnas contiene la tabla buscada
SELECT 
c.name AS ColName, 
t.name AS TableName
FROM sys.columns c
JOIN sys.tables t ON c.object_id = t.object_id
WHERE t.name LIKE '%BSTablaDimension%'

--delete contraints
ALTER TABLE Orders
DROP FOREIGN KEY fk_PerOrders --CONSTRAINTS (no FOREIGN KEYS!)

--delete index
DROP INDEX table_name.index_name

--consulta truco-acumulativa
SELECT EmpresaId, A.fecha, A.importetotal, 
SUM(A.importetotal) over (PARTITION BY Empresaid ORDER BY fecha ROWS UNBOUNDED PRECEDING)
FROM BSTransaccion AS A 
where empresaid = 47
	and isnull(importetotal,0) <> 0
	and fecha between dateadd(day, -80, getdate()) and getdate()
ORDER BY Empresaid , A.fecha ASC
