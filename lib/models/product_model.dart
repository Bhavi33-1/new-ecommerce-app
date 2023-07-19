import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isPopular,
    required this.isRecommended,
  });


  @override
  List<Object?> get props => [
    name,
    category,
    imageUrl,
    price,
    isPopular,
    isRecommended
  ];

  static List<Product> products = [
    const Product(
        name: 'Milk',
        category: 'Milk',
        imageUrl: ('http://ninjacowfarm.com/wp-content/uploads/2015/10/bottle-and-glass-of-milk.jpg'),
        price: 70,
        isPopular: true,
        isRecommended: true,
    ),
    const Product(
      name: 'Soap1',
      category: 'Soaps',
      imageUrl: ('https://www.beautyaz.gr/17570-thickbox_default/donkey-milk-gold-soap-90g.jpg'),
      price: 12,
      isPopular: false,
      isRecommended: true,
    ),
    const Product(
      name: 'Soap2',
      category: 'Soaps',
      imageUrl: ('https://www.beautyaz.gr/17570-thickbox_default/donkey-milk-gold-soap-90g.jpg'),
      price: 24,
      isPopular: false,
      isRecommended: true,
    ),

  ];


}