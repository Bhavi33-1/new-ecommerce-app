import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/blocs/cart/cart_event.dart';
import 'package:newapp/models/modals.dart';

import '../blocs/cart/cart_bloc.dart';
import '../blocs/cart/cart_state.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;

  const ProductCard({
    required this.product,
    this.widthFactor = 2.5,
    this.leftPosition = 5,
    this.isWishlist = false,
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
            left: leftPosition,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 0,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: leftPosition + 5,
            child: Container(width: MediaQuery.of(context).size.width / 2.5 - 10,
              height: 70,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  color: Colors.grey.shade600,
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
                    BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if(state is CartLoading) {
                        return Center(
                        child: CircularProgressIndicator(),
                        );
                    }
                    if(state is CartLoaded) {
                        return Expanded(
                        child: IconButton(
                        icon: Icon(
                        Icons.add_circle,
                        color: Colors.white
                        ),
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(CartProductAdded(product));
                        },
                        ),
                        );
                        } else {
                      return Text('Something went wrong');
                    }
                    },
                   ),

                    isWishlist
                         ? Expanded(
                      child: IconButton(
                        icon: Icon(
                            Icons.delete,
                            color: Colors.white
                        ),
                        onPressed: () {},
                      ),
                    ): SizedBox(),
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