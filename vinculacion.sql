Select distinct
"Pedido" = PV.nombre,
"Factura" = FV.nombre
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
