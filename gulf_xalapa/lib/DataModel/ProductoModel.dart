class ProductoModel {
  String titulo;
  String descripcion;
  String ingredientes;
  String img;
  double precio;
  int puntos;

  ProductoModel(
      {this.titulo,
      this.descripcion,
      this.ingredientes,
      this.img,
      this.precio,
      this.puntos});
}

final tortaPolaca = ProductoModel(
  titulo: 'Torta Polaca',
  descripcion:
      'Una torta que toma como ingrediente principal la carne polaca, preparada con frijoles y pan de telera',
  ingredientes: 'Carne de pollo, pan de telera, frijoles, mayonesa',
  img: 'assets/menu/torta-carnepolaca.jpg',
  precio: 45.0,
  puntos: 45,
);

final bagelSalado = ProductoModel(
  titulo: 'Bagel Saldo',
  descripcion:
      'Snack tipo pizza preparado con peperoni salsa de tomate y queso motzarela',
  ingredientes: 'Peperoni, salsa de tomate, pan, mayonesa, queso motzarela',
  img: 'assets/menu/bagel-salado.jpg',
  precio: 48.0,
  puntos: 48,
);

final cafeCapuchino = ProductoModel(
  titulo: 'Cafe Capuchino',
  descripcion: 'Cafe preparado con grano de la casa, y leche de su eleccion',
  ingredientes: 'Cafe de la casa, leche',
  img: 'assets/menu/capuchino.jpg',
  precio: 30.0,
  puntos: 30,
);

final cafeExpreso = ProductoModel(
  titulo: 'Cafe Expreso',
  descripcion: 'Cafe preparado con grano de la casa',
  ingredientes: 'Cafe de la casa',
  img: 'assets/menu/express.jpg',
  precio: 25.0,
  puntos: 25,
);
