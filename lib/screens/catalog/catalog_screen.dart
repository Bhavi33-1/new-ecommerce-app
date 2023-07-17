// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newapp/widgets/widgets.dart';
import 'package:newapp/models/modals.dart';
import 'package:newapp/models/category_model.dart';

class CatalogScreen extends StatelessWidget {
  // const CatalogScreen({Key? key}) : super(key: key);
  static const String routeName = '/Catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CatalogScreen(category: category),
    );
  }

  final Category category;

  const CatalogScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products.where((product) => product.category == category.name).toList();
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 16.0
        ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.15),
          itemCount: categoryProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: ProductCard(
                product: categoryProducts[index],
                widthFactor: 2.2,
              ),
            );
          },
      ),
      

    );
  }
}