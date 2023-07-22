import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/blocs/cart/cart_state.dart';
import 'package:newapp/models/cart_model.dart';
import 'package:newapp/widgets/widgets.dart';

import '../../blocs/cart/cart_bloc.dart';
import '../../models/product_model.dart';


class CartScreen extends StatelessWidget {
  // const CartScreen({Key? key}) : super(key: key);
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CartScreen(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pinkAccent.shade100,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {},
                child: Text('GO To CHECKOUT',
                    style: Theme.of(context).textTheme.displaySmall!),
              )
            ],),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if(state is CartLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is CartLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.cart.freeDeliveryString,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/');
                          },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade600,
                              shape: RoundedRectangleBorder(),
                              elevation: 0,
                            ),
                            child:
                            Text('Add More Items',
                              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      SizedBox(height: 10),

                      SizedBox(height: 400,
                        child: ListView.builder(
                          itemCount: state.cart
                              .productQuantity(state.cart.products)
                              .keys
                              .length,
                          itemBuilder: (context, index) {
                            return CartProductCard(
                                product: state.cart
                              .productQuantity(state.cart.products)
                              .keys
                              .elementAt(index),
                              quantity: state.cart
                                  .productQuantity(state.cart.products)
                                  .values
                                  .elementAt(index),


                            );
                          },),
                      ),
                    ],
                  ),



                  Column(children: [
                    Divider(thickness: 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'SUBTOTAL',
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                                Text(
                                  '\$${state.cart.subtotalString}',
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'DELIVERY FEE',
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                                Text(
                                  '\$${state.cart.deliveryFeeString}',
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                              ],
                            ),
                          ]),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.black.withAlpha(50),
                          ),
                        ),
                      ],
                    ),
                  ],
                  ),

                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(50),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(5.0),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade600,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'TOTAL',
                                style: Theme.of(context)
                                    .textTheme.headlineSmall!
                                    .copyWith(color: Colors.white),
                              ),
                              Text(
                                '\$${state.cart.totalString}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],),


            );
          }
          else {
            return Text('Something went wrong');
          }
        },

      ));

        }
      }

// class CartProductCard extends StatelessWidget {
//   final Product product;
//   const CartProductCard({
//     Key? key,
//     required this.product,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Row(
//         children: [
//         Image.network(
//           product.imageUrl,
//           width: 100,
//           height: 80,
//           fit: BoxFit.cover,
//         ),
//         SizedBox(width: 10),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//             Text(
//               product.name,
//               style: Theme.of(context).textTheme.headlineSmall,
//             ),
//             Text(
//               '\$${product.price}',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//           ],
//           ),
//         ),
//         SizedBox(width: 10),
//         Row(children: [
//           IconButton(icon: Icon(Icons.remove_circle), onPressed: () {}),
//           Text(
//             '1',
//             style: Theme.of(context).textTheme.headlineSmall,),
//           IconButton(icon: Icon(Icons.add_circle), onPressed: () {}),
//         ],)
//       ],
//       ),
//     );
//   }
// }
