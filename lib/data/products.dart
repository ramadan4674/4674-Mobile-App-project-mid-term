class Product {
  const Product({required this.id, required this.price});
  final String id;
  final int price;
  String get image => 'assets/images/$id.png';
}

const products = [
  Product(id: 'phone', price: 1850),
  Product(id: 'headphones', price: 280),
  Product(id: 'laptop', price: 3200),
  Product(id: 'watch', price: 450),
  Product(id: 'speaker', price: 180),
  Product(id: 'camera', price: 2400),
];
