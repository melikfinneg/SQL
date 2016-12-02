select distinct
"Pedido" = PV.nombre,
"Factura" = FV.nombre,
"Cobranza" = C.nombre
from BSTransaccion PV
--Para filtrar por la categoría Pedido de Venta
inner join FAFTransaccionSubtipo PST on (PST.TransaccionSubtipoID = PV.TransaccionSubtipoID AND PST.TransaccionCategoriaID = -6)
--Items de los Pedidos
inner join BSOperacionitem POI on POI.TransaccionID = PV.TransaccionID
--Items de los Pedidos vinculados
left join BSOperacionitemCancelacion OIC on OIC.OperacionItemIDOrigen = POI.OperacionItemID
--Items de las transacciones vinculadas a los pedidos
left join BSOperacionitem FVIO on FVIO.OperacionItemID = OIC.OperacionItemIDDestino
-- Facturas de Venta vinculadas a los pedidos
left join BSTransaccion FV on FV.TransaccionID = FVIO.TransaccionID
--Para filtrar por la categoría Factura de Venta
left join FAFTransaccionSubtipo FVST on (FVST.TransaccionSubtipoID = FV.TransaccionSubtipoID and FVST.TransaccionCategoriaID = -8)
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
