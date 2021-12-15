class ProductModel {
  final String pid;
  final String name;
  final String price;
  final String color;

  ProductModel(
      {required this.pid,
      required this.name,
      required this.price,
      required this.color});

  factory ProductModel.fromMap(map) {
    return ProductModel(
      pid: map['pid'],
      name: map['name'],
      price: map['price'],
      color: map['color'],
    );
  }

  toMap() {
    return {
      'pid': pid,
      'name': name,
      'price': price,
      'color': color,
    };
  }
}
