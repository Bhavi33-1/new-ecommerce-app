
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
});

  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    Category(
        name: 'Milk',
        imageUrl:
              'http://ninjacowfarm.com/wp-content/uploads/2015/10/bottle-and-glass-of-milk.jpg',
    ),
    Category(
        name: 'Soaps',
        imageUrl:
              'https://www.beautyaz.gr/17570-thickbox_default/donkey-milk-gold-soap-90g.jpg',
    ),
  ];

}

