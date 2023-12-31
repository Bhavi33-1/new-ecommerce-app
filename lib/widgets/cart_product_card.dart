// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/blocs/cart/cart_state.dart';
import '../blocs/cart/cart_bloc.dart';
import '../blocs/cart/cart_event.dart';
import '../models/product_model.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  '\$${product.price}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoading) {
                  return CircularProgressIndicator();
                }
                if (state is CartLoaded) {
                  return Row(
                    children: [
                      IconButton(icon: Icon(Icons.remove_circle),
                        onPressed: () {
                          context.read<CartBloc>().add(
                            CartProductRemoved(product),
                          );
                        },
                      ),
                      Text(
                        '$quantity',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineMedium,
                      ),
                      // Text(
                      //   '$quantity',
                      //   style: Theme
                      //       .of(context)
                      //       .textTheme
                      //       .headlineSmall,
                      // ),
                      IconButton(icon: Icon(Icons.add_circle), onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(CartProductAdded(product));
                        },
                      ),
                    ],
                  );
                }
                return Text('Something went wrong');
              },
          ),
        ],
      ),
    );
  }
}