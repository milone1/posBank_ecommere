class Producto {
  final String estadoProceso;
  final String codigo;
  final String grupo;
  final String subGrupo;
  final String tipoProducto;
  final String descripcion;
  final int precioVenta;
  final bool activo;
  final bool combinacion;
  final int numCombinacion;
  late final List<void>? items;
  final List<void>? propiedades;
  final InsumoCritico? insumoCritico;
  final int timePrepMin;
  final String surlimagen;

  Producto(
      {required this.estadoProceso,
      required this.codigo,
      required this.grupo,
      required this.subGrupo,
      required this.tipoProducto,
      required this.descripcion,
      required this.precioVenta,
      required this.activo,
      required this.combinacion,
      required this.numCombinacion,
      required this.items,
      required this.propiedades,
      required this.insumoCritico,
      required this.timePrepMin,
      required this.surlimagen});

  Producto.fromJson(
      Map<String, dynamic> json,
      this.estadoProceso,
      this.codigo,
      this.grupo,
      this.subGrupo,
      this.tipoProducto,
      this.descripcion,
      this.precioVenta,
      this.activo,
      this.combinacion,
      this.numCombinacion,
      this.items,
      this.propiedades,
      this.insumoCritico,
      this.timePrepMin,
      this.surlimagen);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EstadoProceso'] = estadoProceso;
    data['Codigo'] = codigo;
    data['Grupo'] = grupo;
    data['SubGrupo'] = subGrupo;
    data['TipoProducto'] = tipoProducto;
    data['Descripcion'] = descripcion;
    data['PrecioVenta'] = precioVenta;
    data['Activo'] = activo;
    data['Combinacion'] = combinacion;
    data['NumCombinacion'] = numCombinacion;
    data['TimePrepMin'] = timePrepMin;
    data['Surlimagen'] = surlimagen;
    return data;
  }
}

class InsumoCritico {
  final String codigo;
  final String descripcion;
  final int stock;
  final bool insumo;

  InsumoCritico(
      {required this.codigo,
      required this.descripcion,
      required this.stock,
      required this.insumo});

  InsumoCritico.fromJson(Map<String, dynamic> json, this.codigo,
      this.descripcion, this.stock, this.insumo);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Codigo'] = codigo;
    data['Descripcion'] = descripcion;
    data['Stock'] = stock;
    data['Insumo'] = insumo;
    return data;
  }
}
