class InsumoCritico {
    String? codigo;
    String? descripcion;
    double? stock;
    bool? insumo;

    InsumoCritico({this.codigo, this.descripcion, this.stock, this.insumo}); 

    InsumoCritico.fromJson(Map<String, dynamic> json) {
        codigo = json['Codigo'];
        descripcion = json['Descripcion'];
        stock = json['Stock'];
        insumo = json['Insumo'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['Codigo'] = codigo;
        data['Descripcion'] = descripcion;
        data['Stock'] = stock;
        data['Insumo'] = insumo;
        return data;
    }
}

class Item {
    String? producto;
    double? cantidad;
    bool? fijo;
    bool? unico;
    String? etiqueta;
    double? precio;
    bool? elimina;

    Item({this.producto, this.cantidad, this.fijo, this.unico, this.etiqueta, this.precio, this.elimina}); 

    Item.fromJson(Map<String, dynamic> json) {
        producto = json['Producto'];
        cantidad = json['Cantidad'];
        fijo = json['Fijo'];
        unico = json['Unico'];
        etiqueta = json['Etiqueta'];
        precio = json['Precio'];
        elimina = json['Elimina'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['Producto'] = producto;
        data['Cantidad'] = cantidad;
        data['Fijo'] = fijo;
        data['Unico'] = unico;
        data['Etiqueta'] = etiqueta;
        data['Precio'] = precio;
        data['Elimina'] = elimina;
        return data;
    }
}

class Propiedad {
    String? propiedad;
    String? descripcion;
    String? operador;
    double? precio;

    Propiedad({this.propiedad, this.descripcion, this.operador, this.precio}); 

    Propiedad.fromJson(Map<String, dynamic> json) {
        propiedad = json['Propiedad'];
        descripcion = json['Descripcion'];
        operador = json['Operador'];
        precio = json['Precio'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['Propiedad'] = propiedad;
        data['Descripcion'] = descripcion;
        data['Operador'] = operador;
        data['Precio'] = precio;
        return data;
    }
}

class Root {
    String? estadoProceso;
    String? codigo;
    String? grupo;
    String? subGrupo;
    String? tipoProducto;
    String? descripcion;
    double? precioVenta;
    bool? activo;
    bool? combinacion;
    int? numCombinacion;
    List<Item?>? items;
    List<Propiedad?>? propiedades;
    InsumoCritico? insumoCritico;
    int? timePrepMin;

    Root({this.estadoProceso, this.codigo, this.grupo, this.subGrupo, this.tipoProducto, this.descripcion, this.precioVenta, this.activo, this.combinacion, this.numCombinacion, this.items, this.propiedades, this.insumoCritico, this.timePrepMin}); 

    Root.fromJson(Map<String, dynamic> json) {
        estadoProceso = json['EstadoProceso'];
        codigo = json['Codigo'];
        grupo = json['Grupo'];
        subGrupo = json['SubGrupo'];
        tipoProducto = json['TipoProducto'];
        descripcion = json['Descripcion'];
        precioVenta = json['PrecioVenta'];
        activo = json['Activo'];
        combinacion = json['Combinacion'];
        numCombinacion = json['NumCombinacion'];
        if (json['Items'] != null) {
         items = <Item>[];
         json['Items'].forEach((v) {
         items!.add(Item.fromJson(v));
        });
      }
        if (json['Propiedades'] != null) {
         propiedades = <Propiedad>[];
         json['Propiedades'].forEach((v) {
         propiedades!.add(Propiedad.fromJson(v));
        });
      }
        insumoCritico = json['InsumoCritico'] != null ? InsumoCritico?.fromJson(json['InsumoCritico']) : null;
        timePrepMin = json['TimePrepMin'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
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
        data['Items'] = Item() != null ? items!.map((v) => v?.toJson()).toList() : null;
        data['Propiedades'] =Propiedad() != null ? propiedades!.map((v) => v?.toJson()).toList() : null;
        data['InsumoCritico'] = insumoCritico!.toJson();
        data['TimePrepMin'] = timePrepMin;
        return data;
    }
}

