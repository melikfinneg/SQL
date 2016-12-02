Select distinct
"Factura" = FV.nombre,
"Cobranza" = C.nombre
from BSTransaccion FV
--Para filtrar por la categoría Factura de Venta
inner join FAFTransaccionSubtipo FVST on (FVST.TransaccionSubtipoID = FV.TransaccionSubtipoID and FVST.TransaccionCategoriaID = -8)
--Items de los asientos generados por las facturas
left join BSAsientoItem AI on AI.TransaccionID = FV.TransaccionID
--Items de los asientos aplicados a transacciones
left join BSAsientoItemCancelacion AIC on AIC.AsientoItemIDOrigen = AI.AsientoItemID
--Items de las transacciones aplicadas a las facturas
left join BSAsientoItem CAI on CAI.AsientoItemID = AIC.AsientoItemIDDestino
--Cobranzas aplicadas a las facturas
left join BSTransaccion C on C.TransaccionID = CAI.TransaccionID
--Para filtrar por la categoría Cobranza
left join FAFTransaccionSubtipo CST on (CST.TransaccionSubtipoID = C.TransaccionSubtipoID and CST.TransaccionCategoriaID = -30)
