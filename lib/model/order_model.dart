class Order {
  final String local;
  final String tipopedido;
  final String nombre;
  final String apellido;
  final String telefono;
  final String direccion;
  final String referencia;
  final String correo;
  final String tipodocumento;
  final String ruc;
  final String razonsocial;
  final String direccionClienteFacturado;
  final String fechaenvia;
  final String observacion;
  final String correoElectronico;
  final int estadoPago;
  final String ubigeo;
  final String urbanizacion;
  final String codigoDescuento;
  List<DetallePedido> detallePedido;
  List<Prepagos> prepagos;
  final String fechaEntrega;
  final String codigoOrigenVenta;

  Order(
      {required this.local,
      required this.tipopedido,
      required this.nombre,
      required this.apellido,
      required this.telefono,
      required this.direccion,
      required this.referencia,
      required this.correo,
      required this.tipodocumento,
      required this.ruc,
      required this.razonsocial,
      required this.direccionClienteFacturado,
      required this.fechaenvia,
      required this.observacion,
      required this.correoElectronico,
      required this.estadoPago,
      required this.ubigeo,
      required this.urbanizacion,
      required this.codigoDescuento,
      required this.detallePedido,
      required this.prepagos,
      required this.fechaEntrega,
      required this.codigoOrigenVenta});

  Order.fromJson(
      Map<String, dynamic> json,
      this.local,
      this.tipopedido,
      this.nombre,
      this.apellido,
      this.telefono,
      this.direccion,
      this.referencia,
      this.correo,
      this.tipodocumento,
      this.ruc,
      this.razonsocial,
      this.direccionClienteFacturado,
      this.fechaenvia,
      this.observacion,
      this.correoElectronico,
      this.estadoPago,
      this.ubigeo,
      this.urbanizacion,
      this.codigoDescuento,
      this.detallePedido,
      this.prepagos,
      this.fechaEntrega,
      this.codigoOrigenVenta);
}

class DetallePedido {
  final String item;
  final String codigoproducto;
  final int cantidad;
  final String lcombo;
  final String observacion;

  DetallePedido(
      {required this.item,
      required this.codigoproducto,
      required this.cantidad,
      required this.lcombo,
      required this.observacion});

  DetallePedido.fromJson(Map<String, dynamic> json, this.item,
      this.codigoproducto, this.cantidad, this.lcombo, this.observacion);
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['Item'] = item;
    data['Codigoproducto'] = codigoproducto;
    data['Cantidad'] = cantidad;
    data['Lcombo'] = lcombo;
    data['Observacion'] = observacion;
    return data;
  }
}

class Prepagos {
  final String tipopago;
  final double monto;
  final double vuelto;
  final String tarjeta;
  final String numero;

  Prepagos(
      {required this.tipopago,
      required this.monto,
      required this.vuelto,
      required this.tarjeta,
      required this.numero});

  Prepagos.fromJson(Map<String, dynamic> json, this.tipopago, this.monto,
      this.vuelto, this.tarjeta, this.numero);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Tipopago'] = tipopago;
    data['Monto'] = monto;
    data['Vuelto'] = vuelto;
    data['Tarjeta'] = tarjeta;
    data['Numero'] = numero;
    return data;
  }
}
