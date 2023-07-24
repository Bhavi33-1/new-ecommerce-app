
import 'package:cloud_firestore/cloud_firestore.dart';
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


  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category =
    Category(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }


  static List<Category> categories = [
    const Category(
        name: 'Milk',
        imageUrl: ('http://ninjacowfarm.com/wp-content/uploads/2015/10/bottle-and-glass-of-milk.jpg'),
    ),
    const Category(
        name: 'Soaps',
        imageUrl: ('https://www.beautyaz.gr/17570-thickbox_default/donkey-milk-gold-soap-90g.jpg'),
    ),
  ];

}

