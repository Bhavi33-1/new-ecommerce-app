import 'package:flutter/material.dart';
import 'package:newapp/models/modals.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;

  const ProductCard({
    required this.product,
    this.widthFactor = 2.5,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double widthFactor = MediaQuery.of(context).size.width / 2.5;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context,
            '/product',
            arguments: product
        );
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 80,
            child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover
            ),
          ),
          Positioned(
            top: 60,
            child: Container(width: MediaQuery.of(context).size.width / 2.5,
              height: 0,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: 5,
            child: Container(width: MediaQuery.of(context).size.width / 2.5 - 10,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.black
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '\$${Product.products[0].price}',
                            style:
                            Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Icon(
                            Icons.add_circle,
                            color: Colors.white
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}